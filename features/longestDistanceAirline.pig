REGISTER DistanceCalculator.jar;
ufroutes = LOAD '$routesLocation' using PigStorage(',') AS (airlineIATA:chararray, airID:int, source:chararray, sourceID:int, destination:chararray, destinationID:int, codeshare:chararray, stops:int, equipment:chararray);
ufairlines = LOAD '$airlinesLocation' using PigStorage(',') AS (airlineID:int, name:chararray, alias:chararray, iata:chararray, icao:chararray, callsign: chararray, country:chararray, active:chararray);
ufairports = LOAD '$airportsLocation' using PigStorage(',') AS (airportID:int, airportName:chararray, city:chararray, country:chararray, iata:chararray, icao:chararray, latitude:double, longitude:double, altitude:double, timezone:double, dst:chararray, TZtimezone:chararray, type:chararray, source:chararray);


fairlines = FILTER ufairlines BY name IS NOT NULL and iata IS NOT NULL;
airlines = FOREACH fairlines GENERATE airlineID, name, alias, REPLACE(iata, '"', '') as iata, icao, callsign, country, active;
routes = FILTER ufroutes BY airID is not null and destinationID IS NOT NULL and sourceID IS NOT NULL;
airports = FILTER ufairports BY airportID is not null AND airportName is not null AND latitude IS NOT NULL and longitude IS NOT NULL;

sourceAirports = FOREACH airports GENERATE airportID AS sID, latitude AS sLat, longitude as sLong, iata as sAirportIATA;
destAirports = FOREACH airports GENERATE airportID AS dID, latitude AS dLat, longitude as dLong, iata as dAirportIATA;

airportsSourceRoutes = JOIN sourceAirports BY sID, routes BY sourceID;
airportsDestRoutes = JOIN destAirports BY dID, routes BY destinationID;
routesWithCoordinates = JOIN airportsSourceRoutes BY sourceID, airportsDestRoutes by destinationID;
routesWithAirline = JOIN routesWithCoordinates BY airportsSourceRoutes::routes::airlineIATA, airlines by iata;

r_w_a = FOREACH routesWithAirline GENERATE routesWithCoordinates::airportsSourceRoutes::routes::source AS sname, routesWithCoordinates::airportsSourceRoutes::routes::destination AS dname, sLat, sLong, dLat, dLong, name, iata;
r_w_aDistances = FOREACH r_w_a GENERATE name, iata, sname, dname, sLat, sLong, dLat, dLong, edu.rosehulman.openanalysis.CalcDistance(sLat, sLong, dLat, dLong) AS distanceByAirline;

ordered = ORDER r_w_aDistances BY distanceByAirline DESC;

STORE ordered  INTO '$outputLocation' using PigStorage('\t');

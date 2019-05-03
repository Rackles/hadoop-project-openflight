REGISTER DistanceCalculator.jar;
ufroutes = LOAD '$routesLocation' using PigStorage(',') AS (airlineIATA:chararray, airID:int, source:chararray, sourceID:int, destination:chararray, destinationID:int, codeshare:chararray, stops:int, equipment:chararray);
ufairlines = LOAD '$airlinesLocation' using PigStorage(',') AS (airlineID:int, name:chararray, alias:chararray, iata:chararray, icao:chararray, callsign: chararray, country:chararray, active:chararray);
ufairports = LOAD '$aiportsLocation' using PigStorage(',') AS (airportID:int, airportName:chararray, city:chararray, country:chararray, iata:chararray, icao:chararray, latitude:double, longitude:double, altitude:double, timezone:double, dst:varchar, TZtimezone:chararray, type:chararray, source:chararray);


airlines = FILTER ufairlines BY name IS NOT NULL and iata IS NOT NULL;
routes = FILTER ufroutes BY airID is not null and destinationID IS NOT NULL and sourceID IS NOT NULL;
airports = FILTER ufairports BY airportID is not null AND airportName is not null AND latitude IS NOT NULL and longitude IS NOT NULL;

sourceAirports = FOREACH airports GENERATE id AS sID, latitude AS sLat, longitude as sLong;
destAirports = FOREACH airports GENERATE id AS dID, latitude AS dLat, longitude as dLong;

airportsSourceRoutes = JOIN sourceAirports BY sID, routes BY sourceID;
airportsDestRoutes = JOIN destAirports BY dID, routes BY destinationID;
routesWithCoordinates = JOIN airportsSourceRoutes BY sourceID, airportsDestRoutes by destinationID;
routesWithAirline = JOIN routesWithCoordinates BY airlineIATA, airlines by iata;

r_w_a = FOREACH routesWithAirline GENERATE source AS sname, destination AS dname, sLat, sLong, dLat, dLong, name, iata;
r_w_aDistances = FOREACH r_w_a GENERATE name, iata, sname, dname, sLat, sLong, dLat, dLong, edu.rosehulman.openanalytics.CalcDistance(sLat, sLong, dLat, dLong) AS distanceByAirline;

ordered = ORDER r_w_aDistances BY distanceByAirline DESC;

STORE ordered  INTO '$outputLocation' using PigStorage('\t');






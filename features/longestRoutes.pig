REGISTER DistanceCalculator.jar;
ufroutes = LOAD '$routesLocation' using PigStorage(',') AS (airlineIATA:chararray, airID:int, source:chararray, sourceID:int, destination:chararray, destinationID:int, codeshare:chararray, stops:int, equipment:chararray);
ufairports = LOAD '$airportsLocation' using PigStorage(',') AS (airportID:int, airportName:chararray, city:chararray, country:chararray, iata:chararray, icao:chararray, latitude:double, longitude:double, altitude:double, timezone:double, dst:varchar, TZtimezone:chararray, type:chararray, source:chararray);

routes = FILTER ufroutes BY airID is not null and destinationID IS NOT NULL and sourceID IS NOT NULL;
airports = FILTER ufairports BY airportID is not null AND airportName is not null AND latitude IS NOT NULL and longitude IS NOT NULL;

sourceAirports = FOREACH airports GENERATE id AS sID, latitude AS sLat, longitude as sLong;
destAirports = FOREACH airports GENERATE id AS dID, latitude AS dLat, longitude as dLong;

airportsSourceRoutes = JOIN sourceAirports BY sID, routes BY sourceID;
airportsDestRoutes = JOIN destAirports BY dID, routes BY destinationID;
routesWithCoordinates = JOIN airportsSourceRoutes BY sourceID, airportsDestRoutes by destinationID;

rwc = FOREACH routesWithCoordinates GENERATE source AS sname, destination AS dname, sLat, sLong, dLat, dLong;
rwcDistances = FOREACH rwc GENERATE sname, dname, sLat, sLong, dLat, dLong, edu.rosehulman.openanalytics.CalcDistance(sLat, sLong, dLat, dLong) AS distance;

ordered = ORDER rwcDistances BY distance DESC;

STORE ordered into '$outputLocation' using PigStorage(',');






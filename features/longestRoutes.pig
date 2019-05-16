REGISTER hdfs:///tmp/openflight/jars/DistanceCalculator.jar;

ufroutes = LOAD '$routesLocation' using PigStorage(',') AS (airlineIATA:chararray, airID:int, source:chararray, sourceID:int, destination:chararray, destinationID:int, codeshare:chararray, stops:int, equipment:chararray);
ufairports = LOAD '$airportsLocation' using PigStorage(',') AS (airportID:int, airportName:chararray, city:chararray, country:chararray, iata:chararray, icao:chararray, latitude:double, longitude:double, altitude:double, timezone:double, dst:chararray, TZtimezone:chararray, type:chararray, source:chararray);

routes = FILTER ufroutes BY airID is not null and destinationID IS NOT NULL and sourceID IS NOT NULL;
airports = FILTER ufairports BY airportID is not null AND airportName is not null AND latitude IS NOT NULL and longitude IS NOT NULL;

sourceAirports = FOREACH airports GENERATE airportID AS sID, latitude AS sLat, longitude as sLong;
destAirports = FOREACH airports GENERATE airportID AS dID, latitude AS dLat, longitude as dLong;

airportsSourceRoutes = JOIN sourceAirports BY sID, routes BY sourceID;
-- airportsDestRoutes = JOIN destAirports BY dID, routes BY destinationID;
routesWithCoordinates = JOIN airportsSourceRoutes BY routes::destinationID, destAirports by dID;

rwc = FOREACH routesWithCoordinates GENERATE airportsSourceRoutes::routes::source AS sname, airportsSourceRoutes::routes::destination AS dname, sLat, sLong, dLat, dLong;
rwcDistances = FOREACH rwc GENERATE sname, dname, sLat, sLong, dLat, dLong, edu.rosehulman.openanalysis.CalcDistance(sLat, sLong, dLat, dLong) AS distance;

dRWC = DISTINCT rwcDistances;
ordered = ORDER dRWC BY distance DESC;

limited = LIMIT ordered $limit;

STORE ordered into '$outputLocation' using PigStorage(',');

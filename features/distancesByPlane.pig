REGISTER DistanceCalculator.jar;
ufplanes = LOAD '/tmp/openflight/planes.dat' using PigStorage(',') AS (pname:chararray, iata:chararray, icao:chararray);
ufairports = LOAD '/tmp/openflight/airports.dat' using PigStorage(',') AS (id:int, name:chararray, city:chararray, country:chararray, iata:chararray, icao:chararray, latitude:double, longitude:double, alt: double, time:double, dst:chararray, tzdbtz:chararray, type:chararray, source:chararray);
ufroutes = LOAD '/tmp/openflight/routes.dat' using PigStorage(',') AS (airlineIATA:chararray, airID:int, source:chararray, sourceID:int, destination:chararray, destinationID:int, codeshare:chararray, stops:int, equipment:chararray);

planes = FILTER ufplanes BY pname IS NOT NULL and iata IS NOT NULL;
airports = FILTER ufairports BY id IS NOT NULL and latitude IS NOT NULL and longitude IS NOT NULL;
froutes = FILTER ufroutes BY sourceID IS NOT NULL and destinationID IS NOT NULL and equipment IS NOT NULL;
routes = FOREACH froutes GENERATE sourceID, destinationID, FLATTEN(TOKENIZE(equipment, ' ')) AS equipmentID;

STORE routes INTO '/tmp/openflight/output/planeDistances' using PigStorage(',');

sourceAirports = FOREACH airports GENERATE id AS sID, latitude AS sLat, longitude as sLong;
destAirports = FOREACH airports GENERATE id AS dID, latitude AS dLat, longitude as dLong;

planeRoutes = JOIN planes BY iata, routes BY equipmentID;
planeRouteSource = JOIN planeRoutes BY sourceID, sourceAirports BY sID;
planeRouteAirports = JOIN planeRouteSource BY destinationID, destAirports BY dID;

pra = FOREACH planeRouteAirports GENERATE pname AS planeType, iata AS planeIATA, sLat, sLong, dLat, dLong;
praDistances = FOREACH pra GENERATE planeType, planeIATA, sLat, sLong, dLat, dLong, edu.rosehulman.openanalysis.CalcDistance(sLat, sLong, dLat, dLong) AS distance;
grouped = GROUP praDistances BY planeIATA;

finalOutput = FOREACH grouped GENERATE FLATTEN(group), MAX(praDistances.distance) AS max, AVG(praDistances.distance) AS avg, MIN(praDistances.distance) AS min, COUNT(praDistances) AS total;

--STORE finalOutput into '/tmp/openflight/output/planeDistances/' using PigStorage(',');

routes = LOAD '/tmp/openflight/routes.dat' using PigStorage(',') AS (airlineIATA:chararray, airID:int, source:chararray, sourceID:int, destination:chararray, destinationID:int, codeshare:chararray, stops:int, equipment:chararray);
airports = LOAD '/tmp/openflight/airports.dat' using PigStorage(',') AS (id:int, name:chararray, city:chararray, country:chararray, iata:chararray, icao:chararray, latitude:double, longitude:double, alt: double, time:double, dst:chararray, tzdbtz:chararray, type:chararray, source:chararray);

filteredroutes = FILTER routes BY airID is not null;
groutes = GROUP filteredroutes BY sourceID;
countRoutes = FOREACH groutes GENERATE group AS sourceID, COUNT(filteredroutes) AS count;

connectedAirports = JOIN countRoutes BY sourceID LEFT OUTER, airports BY id;

groupConnected = GROUP connectedAirports BY (id, name, count);

connected = FOREACH groupConnected GENERATE FLATTEN(group);

result = ORDER connected BY count DESC;

STORE result INTO '/tmp/openflight/output/mostConnectedAirports' using PigStorage('\t');
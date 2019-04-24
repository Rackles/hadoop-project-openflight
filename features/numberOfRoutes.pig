routes = LOAD '/tmp/openflight/routes.dat' using PigStorage(',') AS (airlineIATA:chararray, airlineID:int, source:chararray, sourceID:int, destination:chararray, destinationID:int, codeshare:chararray, stops:int, equipment:chararray);
airlines = LOAD '/tmp/openflight/airlines.dat' using PigStorage(',') AS (airlineID:int, airlineName:chararray, alias:chararray, iata:chararray, icao:chararray, callsign: chararray, country:chararray, active:chararray);

filteredroutes = FILTER routes BY airlineID is not null;
filteredairlines = FILTER airlines BY airlineID is not null AND airlineName is not null;

grouped = GROUP filteredroutes BY airlineID;

counted = FOREACH grouped GENERATE FLATTEN(group) AS airlineID, COUNT(filteredroutes) AS total;

joined = JOIN counted BY airlineID LEFT OUTER, filteredairlines BY airlineID;

groupJoined = GROUP joined BY (airlineID, iata, airlineName, total);

finalOutput = FOREACH groupJoined GENERATE FLATTEN(group);

STORE finalOutput INTO '/tmp/openflight/output/numberOfRoutes' using PigStorage('\t');
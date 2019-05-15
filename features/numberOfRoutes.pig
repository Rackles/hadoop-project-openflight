routes = LOAD '$routesLocation' using PigStorage(',') AS (airlineIATA:chararray, airID:int, source:chararray, sourceID:int, destination:chararray, destinationID:int, codeshare:chararray, stops:int, equipment:chararray);
airlines = LOAD '$airlinesLocation' using PigStorage(',') AS (airlineID:int, airlineName:chararray, alias:chararray, iata:chararray, icao:chararray, callsign: chararray, country:chararray, active:chararray);

filteredroutes = FILTER routes BY airID is not null;
filteredairlines = FILTER airlines BY airlineID is not null AND airlineName is not null;

grouped = GROUP filteredroutes BY airID;

counted = FOREACH grouped GENERATE FLATTEN(group) AS airID, COUNT(filteredroutes) AS total;

joined = JOIN counted BY airID LEFT OUTER, filteredairlines BY airlineID;

groupJoined = GROUP joined BY (airID, iata, airlineName, total);

finalOutput = FOREACH groupJoined GENERATE FLATTEN(group);

STORE finalOutput INTO '$outputLocation' using PigStorage(',');

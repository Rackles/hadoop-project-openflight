routes = LOAD '$routesLocation' using PigStorage(',') AS (airlineIATA:chararray, airID:int, source:chararray, sourceID:int, destination:chararray, destinationID:int, codeshare:chararray, stops:int, equipment:chararray);
airports = LOAD '$airportsLocation' using PigStorage(',') AS (airportid:int, airportname:chararray, city:chararray, country:chararray, iata:chararray, icao:chararray, latitude:double, longitude:double, alt: double, time:double, dst:chararray, tzdbtz:chararray, type:chararray, source:chararray);

filteredroutes = FILTER routes BY airID is not null;
groutes = GROUP filteredroutes BY sourceID;
countRoutes = FOREACH groutes GENERATE group as sourceID, COUNT(filteredroutes) AS connections;

connectedAirports = JOIN countRoutes BY sourceID LEFT OUTER, airports BY airportid;

connected = FOREACH connectedAirports GENERATE airportid, airportname, connections, latitude, longitude;

result = ORDER connected BY connections DESC;

limited = LIMIT result $limit;

STORE limited INTO '$outputLocation' using PigStorage(',');
routes = LOAD '$routesLocation' using PigStorage(',') AS (airlineIATA:chararray, airID:int, source:chararray, sourceID:int, destination:chararray, destinationID:int, codeshare:chararray, stops:int, equipment:chararray);
airports = LOAD '$airportsLocation' using PigStorage(',') AS (id:int, name:chararray, city:chararray, country:chararray, iata:chararray, icao:chararray, latitude:double, longitude:double, alt: double, time:double, dst:chararray, tzdbtz:chararray, type:chararray, source:chararray);

filteredroutes = FILTER routes BY sourceID is not null;
slim_routes = FOREACH filteredroutes GENERATE sourceID, destinationID;

country_routes = FOREACH (JOIN slim_routes BY destinationID LEFT OUTER, airports BY id) GENERATE sourceID, country;

connectedAirportCountry_unique = DISTINCT country_routes;

count_airport_country = FOREACH (GROUP connectedAirportCountry_unique BY sourceID) GENERATE group as sourceID, COUNT(connectedAirportCountry_unique) as count;

connected_airports_country = JOIN count_airport_country BY sourceID LEFT OUTER, airports BY id;

connected_country = FOREACH connected_airports_country GENERATE id, name, count, latitude, longitude;

filter_result = FILTER connected_country BY name!='';

result_country = ORDER filter_result BY count DESC;

limited = LIMIT result_country 10;

STORE limited INTO '$outputLocation' using PigStorage(',');

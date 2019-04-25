routes = LOAD '/tmp/openflight/routes.dat' using PigStorage(',') AS (airlineIATA:chararray, airID:int, source:chararray, sourceID:int, destination:chararray, destinationID:int, codeshare:chararray, stops:int, equipment:chararray);
airports = LOAD '/tmp/openflight/airports.dat' using PigStorage(',') AS (id:int, name:chararray, city:chararray, country:chararray, iata:chararray, icao:chararray, latitude:double, longitude:double, alt: double, time:double, dst:chararray, tzdbtz:chararray, type:chararray, source:chararray);

filteredroutes = FILTER routes BY sourceID is not null;
slim_routes = FOREACH filteredroutes GENERATE sourceID, destinationID;

country_routes = FOREACH (JOIN slim_routes BY destinationID LEFT OUTER, airports BY id) GENERATE sourceID, country;

connectedAirportCountry_unique = DISTINCT country_routes;

count_airport_country = FOREACH (GROUP connectedAirportCountry_unique BY sourceID) GENERATE group as airportID, COUNT(connectedAirportCountry_unique) as count;

connected_airports_country = JOIN count_airport_country BY airportID LEFT OUTER, airports BY id;

groupConnected_country = GROUP connected_airports_country BY (id, name, count);

connected_country = FOREACH groupConnected_country GENERATE FLATTEN(group);

result_country = ORDER connected_country BY count DESC;

STORE result_country INTO '/tmp/openflight/output/mostConnectedAirportsCountry' using PigStorage('\t');

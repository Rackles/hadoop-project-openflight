records = LOAD '/tmp/openflight/airports.dat' using PigStorage(',') AS (airportid:int, name:chararray, city:chararray, country:chararray, iata:chararray, icao:chararray, latitude:double, longitude:double, alt: double, time:double, dst:chararray, tzdbtz:chararray, type:chararray, source:chararray);
countries = GROUP records BY country;
numOfAirports = FOREACH countries GENERATE records.country, COUNT(records.airportid) AS NumberOfAirports;
groupAll = GROUP numOfAirports ALL;
max = FOREACH groupAll GENERATE numOfAirports.country, MAX(numOfAirports.NumberOfAirports);
STORE numOfAirports INTO '/tmp/openflight/output/numOfAirports/' using PigStorage(',');

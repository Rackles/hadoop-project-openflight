records = LOAD '/tmp/openflight/airlines.dat' using PigStorage(',') AS (airlineid:int, name:chararray, alias:chararray, iata:chararray, icao:chararray, callsign: chararray, country:chararray, active:chararray);
countries = GROUP records BY country;
numOfAirlines = FOREACH countries GENERATE group, COUNT(records.airlineid) AS NumberOfAirlines;
groupAll = GROUP numOfAirlines ALL;
max = FOREACH groupAll GENERATE countries.country, MAX(countries.NumberOfAirlines)
STORE numOfAirlines INTO 'NumberOfAirlines' USING org.apache.hive.hcatalog.pig.HCatStorer();
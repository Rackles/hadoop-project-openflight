records = LOAD '/tmp/openflight/airports.dat' using PigStorage(',') AS (airportid:int, name:chararray, city:chararray, country:chararray, iata:chararray, icao:chararray, latitude:double, longitude:double, alt: double, time:double, dst:chararray, tzdbtz:chararray, type:chararray, source:chararray);
countries = GROUP records BY country;
numOfAirports = FOREACH countries GENERATE group, COUNT(records.airportid) AS NumberOfAirports;
ordered = ORDER numOfAirports BY NumberOfAirports DESC;
max = LIMIT ordered 1;
STORE max INTO '/tmp/openflight/output/numOfAirports/' using PigStorage(',');

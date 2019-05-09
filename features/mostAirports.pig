records = LOAD '$airportsLocation' using PigStorage(',') AS (airportid:int, name:chararray, city:chararray, country:chararray, iata:chararray, icao:chararray, latitude:double, longitude:double, alt: double, time:double, dst:chararray, tzdbtz:chararray, type:chararray, source:chararray);
countries = GROUP records BY country;
numOfAirports = FOREACH countries GENERATE FLATTEN(group), records.latitude, records.longitude, COUNT(records.airportid) AS NumberOfAirports;
ordered = ORDER numOfAirports BY NumberOfAirports DESC;
max = LIMIT ordered $limit;
STORE max INTO '$outputLocation' using PigStorage(',');

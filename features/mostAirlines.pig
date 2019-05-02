records = LOAD '$airportsLocation' using PigStorage(',') AS (airlineid:int, name:chararray, alias:chararray, iata:chararray, icao:chararray, callsign: chararray, country:chararray, active:chararray);
countries = GROUP records BY country;
numOfAirlines = FOREACH countries GENERATE FLATTEN(group), records.latitude, records.longitude, COUNT(records.airlineid) AS NumberOfAirlines;
ordered = ORDER numOfAirlines BY NumberOfAirlines DESC;
max = LIMIT ordered $limit;
STORE max INTO '$outputLocation' using PigStorage(',');

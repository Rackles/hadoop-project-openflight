records = LOAD '/tmp/openflight/airports.dat' using PigStorage(',') AS (id:int, name:chararray, city:chararray, country:chararray, iata:chararray, icao:chararray, latitude:double, longitude:double, alt: double, time:double, dst:chararray, tzdbtz:chararray, type:chararray, source:chararray);
frecords = FILTER records by id IS NOT NULL and alt IS NOT NULL;
orecords = ORDER frecords BY alt DESC;
srecords = FOREACH orecords GENERATE id, name, city, country, iata, alt;
lowAltOutput = LIMIT srecords $num;
STORE lowAltOutput into '/tmp/openflight/output/highaltitude/' using PigStorage(',');

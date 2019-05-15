records = LOAD '$airportsLocation' using PigStorage(',') AS (id:int, name:chararray, city:chararray, country:chararray, iata:chararray, icao:chararray, latitude:double, longitude:double, alt: double, time:double, dst:chararray, tzdbtz:chararray, type:chararray, source:chararray);
frecords = FILTER records by id IS NOT NULL and alt IS NOT NULL;
orecords = ORDER frecords BY alt ASC;
srecords = FOREACH orecords GENERATE id, name, city, country, iata, alt, latitude, longitude;
lowAltOutput = LIMIT srecords $limit;
STORE lowAltOutput into '$outputLocation' using PigStorage(',');

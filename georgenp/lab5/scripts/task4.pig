REGISTER Task4Jar.jar;
records = LOAD '$input' using PigStorage('\t');
finalOutput = STREAM records THROUGH 'tail -n +2' AS (date:chararray, time:chararray, xloc:chararray, sc:int, c-ip:chararray, cs-m:chararray, cs:chararray, cs-uri-stem:chararray, sc-s:chararray, csR:chararray, csU:chararray, csq:chararray, csC:chararray, x-edge-result-type:chararray, x-edge-request-id:chararray);
--crecords = FOREACH frecords GENERATE FLATTEN(STRSPLIT(date, '-')) AS (year:int, month:int, day:int), FLATTEN(STRSPLIT(time,':')) AS (hour:int, min:int, sec:int), cs-uri-stem, x-edge-result-type;
--grouped = GROUP crecords BY (cs-uri-stem, year, month, day, hour);
--hitsOnly = FILTER grouped BY x-edge-result-type == 'hit';
--missOnly = FILTER grouped BY x-edge-result-type == 'miss';

--total = FOREACH grouped COUNT crecords;
--hits = FOREACH hitsOnly COUNT crecords;
--misses = FOREACH missOnly COUNT crecords;
--stats = FOREACH grouped GENERATE cs-uri-stem, edu.rosehulman.georgenp.Ratio(hits, total), edu.rosehulman.georgenp.Ratio(errors, total), year, month, day, hour;

STORE finalOutput INTO '${output}/tmp' using PigStorage('\t');
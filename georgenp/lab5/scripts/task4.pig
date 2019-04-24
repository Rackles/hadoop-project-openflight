REGISTER Task4Jar.jar;
records = LOAD '$input' using PigStorage('\t')  AS (date:chararray, time:chararray, xloc:chararray, sc:int, cip:chararray, csm:chararray, cs:chararray, csuristem:chararray, scs:chararray, csR:chararray, csU:chararray, csq:chararray, csC:chararray, xedgeresulttype:chararray, xedgerequestid:chararray);
ranked = RANK records;
finalOutput = FILTER ranked BY $0 > 2;
--crecords = FOREACH frecords GENERATE FLATTEN(STRSPLIT(date, '-')) AS (year:int, month:int, day:int), FLATTEN(STRSPLIT(time,':')) AS (hour:int, min:int, sec:int), csuristem, xedgeresulttype;
--grouped = GROUP crecords BY (csuristem, year, month, day, hour);
--hitsOnly = FILTER grouped BY xedgeresulttype == 'hit';
--missOnly = FILTER grouped BY xedgeresulttype == 'miss';

--total = FOREACH grouped COUNT crecords;
--hits = FOREACH hitsOnly COUNT crecords;
--misses = FOREACH missOnly COUNT crecords;
--stats = FOREACH grouped GENERATE csuristem, edu.rosehulman.georgenp.Ratio(hits, total), edu.rosehulman.georgenp.Ratio(errors, total), year, month, day, hour;

STORE finalOutput INTO '${output}/tmp' using PigStorage('\t');
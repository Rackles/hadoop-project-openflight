REGISTER Task4Jar.jar;
records = LOAD '$input' using PigStorage('\t')  AS (date:chararray, time:chararray, xloc:chararray, sc:int, cip:chararray, csm:chararray, cs:chararray, csuristem:chararray, scs:chararray, csR:chararray, csU:chararray, csq:chararray, csC:chararray, xedgeresulttype:chararray, xedgerequestid:chararray);
ranked = RANK records;
frecords = FILTER ranked BY $0 > 2;
crecords = FOREACH frecords GENERATE FLATTEN(STRSPLIT(date, '-')) AS (year:int, month:int, day:int), FLATTEN(STRSPLIT(time,':')) AS (hour:int, min:int, sec:int), FLATTEN(STRSPLIT(csuristem, '/', 4)) AS (blank:chararray, blog:chararray, sitename:chararray, misc:chararray), xedgeresulttype;
nrecords = FOREACH crecords GENERATE year, month, day, hour, sitename, xedgeresulttype;
--grouped = GROUP crecords BY (sitename, year, month, day, hour);
--hitsOnly = FILTER grouped BY xedgeresulttype == 'hit';
--missOnly = FILTER grouped BY xedgeresulttype == 'miss';

--total = FOREACH grouped COUNT crecords;
--hits = FOREACH hitsOnly COUNT crecords;
--misses = FOREACH missOnly COUNT crecords;
--stats = FOREACH grouped GENERATE sitename, edu.rosehulman.georgenp.Ratio(hits, total), edu.rosehulman.georgenp.Ratio(errors, total), year, month, day, hour;

STORE nrecords INTO '${output}/tmp' using PigStorage('\t');
REGISTER Task4Jar.jar;
records = LOAD '$input' using PigStorage('\t')  AS (date:chararray, time:chararray, xloc:chararray, sc:int, cip:chararray, csm:chararray, cs:chararray, csuristem:chararray, scs:chararray, csR:chararray, csU:chararray, csq:chararray, csC:chararray, xedgeresulttype:chararray, xedgerequestid:chararray);
ranked = RANK records;
frecords = FILTER ranked BY $0 > 2;
crecords = FOREACH frecords GENERATE FLATTEN(STRSPLIT(date, '-')) AS (year:int, month:int, day:int), FLATTEN(STRSPLIT(time,':')) AS (hour:int, min:int, sec:int), FLATTEN(STRSPLIT(csuristem, '/', 4)) AS (blank:chararray, blog:chararray, sitename:chararray, misc:chararray), xedgeresulttype;
nrecords = FOREACH crecords GENERATE date, year, month, day, hour, sitename, xedgeresulttype;
grouped = GROUP crecords BY (sitename, year, month, day, hour);

counted = FOREACH grouped {
			hitsOnly = FILTER crecords BY xedgeresulttype == 'Hit';
			missOnly = FILTER crecords BY xedgeresulttype != 'Hit';
			
			GENERATE FLATTEN(group), COUNT(hitsOnly) AS hits, COUNT(missOnly) AS miss, COUNT(crecords) AS total;
		};


stats = FOREACH counted GENERATE date, sitename, edu.rosehulman.georgenp.Ratio(hits, total), edu.rosehulman.georgenp.Ratio(miss, total), year, month, day, hour;

STORE stats INTO '$output' using org.apache.pig.piggybank.storage.MultiStorage('$output', '0', 'none', '\t', 'true');
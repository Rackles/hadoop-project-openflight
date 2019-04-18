records = LOAD '$input' using PigStorage('\t') AS (year:int, temp:int, quality:int);
frecords = FILTER records by quality == 0 or quality == 1;
minrec = ORDER frecords BY temp ASC;
maxrec = ORDER frecords BY temp DESC;
dump LIMIT minrec 1
dump LIMIT maxrec 1
grouped = GROUP frecords ALL;
avg = FOREACH grouped GENERATE AVG(frecords.temp);
dump avg
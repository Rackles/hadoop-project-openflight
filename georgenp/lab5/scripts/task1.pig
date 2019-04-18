records = LOAD 'openflight/georgenp/lab5/data/tempInput.txt' using PigStorage('\t') AS (year:int, temp:int, quality:int);
frecords = FILTER records by quality == 0 or quality == 1;
minrec = ORDER frecords BY temp ASC;
maxrec = ORDER frecords BY temp DESC;
min = LIMIT minrec 1;
dump min
max = LIMIT maxrec 1;
dump max
grouped = GROUP frecords ALL;
avg = FOREACH grouped GENERATE AVG(frecords.temp);
dump avg
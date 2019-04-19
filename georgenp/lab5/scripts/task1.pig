records = LOAD 'openflight/georgenp/lab5/data/input/tempInput.txt' using PigStorage('\t') AS (year:int, temp:int, quality:int);
frecords = FILTER records by quality == 0 or quality == 1;
minrec = ORDER frecords BY temp ASC;
maxrec = ORDER frecords BY temp DESC;
min = LIMIT minrec 1;
STORE min INTO 'openflight/georgenp/lab5/data/output/t1.txt' using PigStorage('\t');
max = LIMIT maxrec 1;
-STORE max INTO 'openflight/georgenp/lab5/data/output/t1.txt' using PigStorage('\t');
grouped = GROUP frecords ALL;
avg = FOREACH grouped GENERATE AVG(frecords.temp);
-STORE avg INTO 'openflight/georgenp/lab5/data/output/t1.txt' using PigStorage('\t');
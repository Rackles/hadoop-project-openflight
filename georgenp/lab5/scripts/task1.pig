records = LOAD '$input' using PigStorage('\t') AS (year:int, temp:int, quality:int);
frecords = FILTER records by quality == 0 or quality == 1;
minrec = ORDER frecords BY temp ASC;
maxrec = ORDER frecords BY temp DESC;
min = LIMIT minrec 1;
%declare mindir CONCAT('$output', '\min') 
STORE min INTO mindir using PigStorage('\t');
max = LIMIT maxrec 1;
%declare maxdir CONCAT('$output', '\max') 
STORE max INTO maxdir using PigStorage('\t');
grouped = GROUP frecords ALL;
avg = FOREACH grouped GENERATE AVG(frecords.temp);
%declare avgdir CONCAT('$output', '\avg') 
STORE avg INTO avgdir using PigStorage('\t');

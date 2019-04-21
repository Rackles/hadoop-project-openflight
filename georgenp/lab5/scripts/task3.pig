REGISTER Task3Jar.jar;
records = LOAD '$input' using PigStorage('\t') AS (year:int, temp:int, quality:int);
frecords = FILTER records by edu.rosehulman.georgenp.QualityIsValid(records);
grouped = GROUP frecords BY year;
minrec = ORDER grouped BY temp ASC;
maxrec = ORDER grouped BY temp DESC;
min = LIMIT minrec 1;
STORE min INTO '${output}/min' using PigStorage('\t');
max = LIMIT maxrec 1;
STORE min INTO '${output}/max' using PigStorage('\t');
avg = FOREACH grouped GENERATE AVG(grouped.temp);
STORE avg INTO '${output}/avg' using PigStorage('\t');

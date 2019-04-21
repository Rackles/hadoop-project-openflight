REGISTER Task3Jar.jar;
records = LOAD '$input' using PigStorage('\t') AS (year:int, temp:int, quality:int);
frecords = FILTER records BY edu.rosehulman.georgenp.QualityIsValid(records.quality);
grouped = GROUP frecords ALL;
minrec = FOREACH grouped GENERATE MIN(frecords.temp);
maxrec = FOREACH grouped GENERATE MAX(frecords.temp);
STORE minrec INTO '${output}/min' using PigStorage('\t');
STORE maxrec INTO '${output}/max' using PigStorage('\t');
avg = FOREACH grouped GENERATE AVG(frecords.temp);
STORE avg INTO '${output}/avg' using PigStorage('\t');

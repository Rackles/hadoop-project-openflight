REGISTER Task3Jar.jar;
records = LOAD '$input' using PigStorage('\t') AS (year:int, temp:int, quality:int);
frecords = FILTER records by edu.rosehulman.georgenp.QualityIsValid(records);

REGISTER georgenpUDF.jar;
grades = LOAD '$gradesLocation' using PigStorage(',') AS (fname:chararray, lname:chararray, cNum:chararray, score:double);
courses = LOAD '$coursesLocation' using PigStorage(',') AS (cNo:chararray, cName:chararray);

filteredGrades = FILTER grades BY score <= 90.0;

nameGrades = FOREACH filteredGrades GENERATE edu.rosehulman.georgenp.ConcatName(fname, lname) AS fullname, cNum, edu.rosehulman.georgenp.ScoreToGrade(score) AS grade;
courseGrades = JOIN nameGrades BY cNum, courses BY cNo; 

STORE courseGrades INTO '${pigOutput}/${username}' using PigStorage('\t');
REGISTER Task2Jar.jar;
records = LOAD '$input' AS (line:chararray);
words = FOREACH records GENERATE FLATTEN(TOKENIZE(line)) as word;
uppers = FOREACH words GENERATE edu.rosehulman.georgenp.Upper(word);
grouped = GROUP uppers BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(uppers);
STORE wordcount INTO '${output}/counts' using PigStorage('\t');

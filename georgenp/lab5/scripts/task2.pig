REGISTER Task2Jar.jar;
records = LOAD '$input' AS (line:chararray);
words = FOREACH line GENERATE FLATTEN(TOKENIZE(line)) as word;
uppers = FOREACH words GENERATE Task2Jar.Upper(word);
grouped = GROUP uppers BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(uppers);
STORE wordcount INTO '${output}/counts' using PigStorage('\t');

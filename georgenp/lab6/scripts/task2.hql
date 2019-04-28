--CREATE DATABASE IF NOT EXISTS '${hiveconf:databaseName}';
CREATE DATABASE IF NOT EXISTS lab6georgenp;

USE lab6georgenp;

CREATE TABLE Words
(
line STRING
);
--ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
--STORED AS TEXTFILE;

LOAD DATA INPATH '/user/root/openflight/georgenp/lab6/data/output/testFile.txt' overwrite INTO table Words;

SELECT word, COUNT(*) AS count FROM Words LATERAL VIEW EXPLODE(SPLIT(line, ' ')) lTable AS word GROUP BY word;
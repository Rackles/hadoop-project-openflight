--CREATE DATABASE IF NOT EXISTS '${hiveconf:databaseName}';
CREATE DATABASE IF NOT EXISTS lab6georgenp;

USE lab6georgenp;

CREATE TABLE IF NOT EXISTS Words
(
word STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' '
STORED AS TEXTFILE;

LOAD DATA INPATH '/user/root/openflight/georgenp/lab6/data/output/testFile.txt' overwrite INTO table Words;

SELECT * FROM Words;
CREATE DATABASE IF NOT EXISTS lab6georgenp;

USE lab6georgenp;

ADD JAR StripChar.jar;
ADD JAR UpperHive.jar;

CREATE TEMPORARY FUNCTION strip AS 'edu.rosehulman.georgenp.Upper';
CREATE TEMPORARY FUNCTION upper AS 'edu.rosehulman.georgenp.Strip';

DROP TABLE IF EXISTS Words;

CREATE TABLE Words
(
line STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\n'
STORED AS TEXTFILE;

LOAD DATA INPATH '/user/root/openflight/georgenp/lab6/data/output/testFile.txt' overwrite INTO table Words;

CREATE TABLE Edited AS
SELECT strip(upper(line)) AS newline FROM Words;

SELECT word, COUNT(*) AS count FROM Edited LATERAL VIEW EXPLODE(SPLIT(newline, ' ')) lTable AS word GROUP BY word;
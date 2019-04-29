CREATE DATABASE IF NOT EXISTS ${databaseName};

USE ${databaseName};

ADD JAR StripChar.jar;
CREATE TEMPORARY FUNCTION strip AS 'edu.rosehulman.georgenp.Upper';

ADD JAR UpperHive.jar;
CREATE TEMPORARY FUNCTION upper AS 'edu.rosehulman.georgenp.Strip';

DROP TABLE IF EXISTS ${tableName};

CREATE TABLE ${tableName}
(
line STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\n'
STORED AS TEXTFILE;

LOAD DATA INPATH '${inputLocation}' overwrite INTO table ${tableName};

CREATE TABLE Edited AS
SELECT strip(upper(line)) AS newline FROM ${tableName};

SELECT word, COUNT(*) AS count FROM Edited LATERAL VIEW EXPLODE(SPLIT(newline, ' ')) lTable AS word GROUP BY word;
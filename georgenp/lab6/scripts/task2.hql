--beeline -u jdbc:hive2://10.128.0.4:10000 -n hive -p amin -f task4.hql --hivevar databaseName=logAnalysisgeorgenp --hivevar pigOutputDir=/user/root/openflight/georgenp/lab5/data/output/task4/2013-06-06/2013-06-06-0,000 --hivevar inputYear=2013 --hivevar inputMonth=06 --hivevar inputDay=06 --hivevar inputHour=21


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
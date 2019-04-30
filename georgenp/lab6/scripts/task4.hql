CREATE DATABASE IF NOT EXISTS ${databaseName};

USE ${databaseName};

DROP TABLE IF EXISTS archiveLogData;

CREATE TABLE IF NOT EXISTS archiveLogData
(
	index string,
	blog string,
	hits string,
	misses string,
	year int,
	month int,
	day int,
	hour int
);

--LOAD DATA INPATH '/user/root/openflight/georgenp/lab5/data/output/task4/2013-06-06/2013-06-06-0,000' overwrite INTO table archiveLogData;
LOAD DATA INPATH '${pigOutputDir}' overwrite INTO table archiveLogData;

CREATE TABLE logData
(
	index string,
	blog string,
	hits string,
	misses string
)
Partitioned by (year int, month int, day int, hour int)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS orc;

SET hive.exec.dynamic.partition.mode=nonstrict;
INSERT INTO TABLE logData partition(cno) SELECT * FROM archiveLogData WHERE year = ${inputYear} AND month = ${inputMonth} AND day = ${inputDay} AND hour = ${inputHour};

SELECT * FROM logData;
SELECT * FROM archiveLogData;
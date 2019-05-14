CREATE DATABASE IF NOT EXISTS ${databaseName};

USE ${databaseName};

DROP TABLE IF EXISTS ${tableName};

CREATE TABLE IF NOT EXISTS ${tableName}
(
	index string,
	blog string,
	hits string,
	misses string,
	year int,
	month int,
	day int,
	hour int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;

LOAD DATA INPATH '${pigOutputDir}' overwrite INTO table ${tableName};

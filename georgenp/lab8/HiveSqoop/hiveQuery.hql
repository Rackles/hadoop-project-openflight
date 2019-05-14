CREATE DATABASE IF NOT EXISTS ${databaseName};

USE ${databaseName};

DROP TABLE IF EXISTS ${tableName};

CREATE EXTERNAL TABLE IF NOT EXISTS ${tableName}
(
year int,
temp int,
quality int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/tmp/georgenp/hiveDB/lab8';

LOAD DATA INPATH '${inputLocation}' overwrite INTO table ${tableName};

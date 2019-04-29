--DROP DATABASE IF EXISTS ${databaseName};

CREATE DATABASE IF NOT EXISTS ${databaseName};
--CREATE DATABASE IF NOT EXISTS lab6georgenp;

USE ${databaseName};

DROP TABLE IF EXISTS ${tableName};

CREATE TABLE IF NOT EXISTS ${tableName}
--CREATE TABLE IF NOT EXISTS Temperature
(
year int,
temp int,
quality int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;

--LOAD DATA INPATH '/user/root/openflight/georgenp/lab6/data/output/tempInput.txt' overwrite INTO table Temperature;
LOAD DATA INPATH '${inputLocation}' overwrite INTO table ${tableName};


CREATE TABLE IF NOT EXISTS filteredTemps AS
--SELECT year, temp, quality FROM Temperature WHERE quality = 0 OR quality = 1;
SELECT year, temp, quality FROM ${tableName} WHERE quality = 0 OR quality = 1;

--CREATE TABLE IF NOT EXISTS output AS
SELECT year, MAX(temp) AS max, MIN(temp) as min, AVG(temp) as avg FROM filteredTemps GROUP BY year;

--SHOW output;
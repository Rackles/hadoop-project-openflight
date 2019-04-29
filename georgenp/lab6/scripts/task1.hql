CREATE DATABASE IF NOT EXISTS '${hiveconf:databaseName}';
--CREATE DATABASE IF NOT EXISTS lab6georgenp;

USE lab6georgenp;

CREATE TABLE IF NOT EXISTS ${hiveconf:tableName}
--CREATE TABLE IF NOT EXISTS Temperature
(
year int,
temp int,
quality int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;

--LOAD DATA INPATH '/user/root/openflight/georgenp/lab6/data/output/tempInput.txt' overwrite INTO table Temperature;
LOAD DATA INPATH '${hiveconf:inputLocation}' overwrite INTO table ${hiveconf:tableName};


CREATE TABLE IF NOT EXISTS filteredTemps AS
--SELECT year, temp, quality FROM Temperature WHERE quality = 0 OR quality = 1;
SELECT year, temp, quality FROM ${hiveconf:tableName} WHERE quality = 0 OR quality = 1;

--CREATE TABLE IF NOT EXISTS output AS
SELECT year, MAX(temp) AS max, MIN(temp) as min, AVG(temp) as avg FROM filteredTemps GROUP BY year;

--SHOW output;
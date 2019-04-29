CREATE DATABASE IF NOT EXISTS ${databaseName};

USE ${databaseName};

DROP TABLE IF EXISTS ${tableName};

CREATE TABLE IF NOT EXISTS ${tableName}
(
year int,
temp int,
quality int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;

LOAD DATA INPATH '${inputLocation}' overwrite INTO table ${tableName};


CREATE TABLE IF NOT EXISTS filteredTemps AS
SELECT year, temp, quality FROM ${tableName} WHERE quality = 0 OR quality = 1;

SELECT year, MAX(temp) AS max, MIN(temp) as min, AVG(temp) as avg FROM filteredTemps GROUP BY year;
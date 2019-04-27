SET hive.variable.substitute=true;

CREATE DATABASE IF NOT EXISTS '${hiveconf:databaseName}';

USE '${hiveconf:databaseName}';

CREATE TABLE IF NOT EXISTS '${hiveconf:tableName}'
(
year int,
temp int,
quality int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE

LOAD DATA INPATH '${hiveconf:inputLocation}' overwrite INTO table Temperature;

CREATE TABLE IF NOT EXISTS filteredTemps AS
SELECT year, temp, quality FROM Temperature WHERE quality = 0 OR quality = 1;

CREATE TABLE IF NOT EXISTS output AS
SELECT year, MAX(temp), MIN(temp), AVG(temp) FROM filteredTemps GROUP BY year;

SHOW output;
USE ${databaseName};

DROP TABLE IF EXISTS ${dTableName};

CREATE TABLE IF NOT EXISTS ${dTableName}
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
INSERT INTO TABLE ${dTableName} partition(year, month, day, hour) SELECT * FROM ${tableName};

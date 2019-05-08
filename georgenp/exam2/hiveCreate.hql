CREATE DATABASE IF NOT EXISTS ${databaseName};

USE ${databaseName};

CREATE TABLE IF NOT EXISTS ${tempTableName}
(
    name string,
    cno string,
    cname string,
    grade string
)
PARTITIONED BY (username string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS ${tableName}
(
    name string,
    cno string,
    cname string,
    grade string
)
PARTITIONED BY (username string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS orc;
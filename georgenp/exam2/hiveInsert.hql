USE ${databaseName};

LOAD DATA INPATH '${fileLocation}' overwrite INTO table ${tempTableName} Partition(username = 'georgenp');

Set hive.exec.dynamic.partition.mode=nonstrict;
INSERT INTO TABLE ${tableName} Partition(username) SELECT * FROM ${tempTableName};

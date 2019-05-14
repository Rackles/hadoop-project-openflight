USE ${databaseName};

LOAD DATA INPATH '${pigOutputDir}/${inputYear}-${inputMonth}-${inputDay}' overwrite INTO table ${tableName};

SET hive.exec.dynamic.partition.mode=nonstrict;
INSERT INTO TABLE ${dTableName} partition(year, month, day, hour) SELECT * FROM ${tableName};

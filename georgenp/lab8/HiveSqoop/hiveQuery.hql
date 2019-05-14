USE ${databaseName};

LOAD DATA INPATH '${inputLocation}' overwrite INTO table ${tableName};

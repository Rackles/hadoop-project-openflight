sqoop import-all-tables --connect jdbc:mysql://$1/sqooptest --username hive --password admin -m 1 --warehouse-dir /tmp/sqoopAll/ --fields-terminated-by ',' --null-string '\\N' --null-non-string '\\N'

exit 0;
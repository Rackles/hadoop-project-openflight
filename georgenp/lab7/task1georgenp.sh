sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin --table Employees --split-by eid --target-dir /tmp/sqoopOutput

sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin --table Employees -m 1 --target-dir /tmp/sqoopMapOutput

sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin --table Employees -m 2 --split-by eid --target-dir /tmp/sqoopSeqOutput --as-sequencefile

sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin --table Employees -m 2 --split-by eid --warehouse-dir /tmp/sqoop/Employees

sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin --table Employees -m 2 --warehouse-dir /tmp/sqoop/Employees --fields-terminated-by '\t' --null-string 'This is a Null String'

hive -e 'create database sqooptest';

sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin -m 2 --table Employees --split-by eid --hive-import --create-hive-table --hive-table sqooptest.Employees

sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin -m 2 --table Employees --split-by eid --hive-import --create-hive-table --hive-table sqooptest.Employees --fields-terminated-by '\t' --null-string 'This is a Null String'

sqoop import-all-tables --connect jdbc:mysql://$1/sqooptest --username hive --password admin -m 1 --warehouse-dir /tmp/sqoopAll/ --fields-terminated-by ',' --null-string '\\N' --null-non-string '\\N'

exit 0;
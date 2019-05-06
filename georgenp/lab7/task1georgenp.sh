sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin --table Employees --split-by eid --target-dir /tmp/sqoopOutput

sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin --table Employees -m 1 --target-dir /tmp/sqoopMapOutput

sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin -m 2 --table Employees --target-dir /tmp/sqoopSeqOutput --as-sequencefile

sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin --table Employees -m 2 --warehouse-dir /tmp/sqoop/Employees

sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin --table Employees -m 2 --warehouse-dir /tmp/sqoop/Employees --fields-terminated-by '\t' --null-string 'This is a Null String'

exit 0;
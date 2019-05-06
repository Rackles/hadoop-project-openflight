sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin -m 2 --table Employees --target-dir /tmp/sqoopSeqOutput --as-sequencefile

exit 0;
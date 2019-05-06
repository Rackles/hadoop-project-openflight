sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin --table Employees -m 1 --target-dir /tmp/sqoopMapOutput

exit 0;
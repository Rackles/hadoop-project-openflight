sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin --table Employees --split-by eid --target-dir /tmp/sqoopOutput

exit 0;
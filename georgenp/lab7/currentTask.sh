sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin --table Employees -m 2 --split-by eid --warehouse-dir /tmp/sqoop/Employees

exit 0;
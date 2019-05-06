sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin -m 2 --table Employees --split-by eid --hive-import --create-hive-table --hive-table sqooptest.Employees

exit 0;
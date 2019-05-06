sqoop create-hive-table --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin --table Employees --hive-import --create-hive-table --hive-table sqooptest.Employees

exit 0;
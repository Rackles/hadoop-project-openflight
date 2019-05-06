sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin -m 2 --table Employees --split-by eid --hive-import --create-hive-table --hive-table sqooptest.Employees2 --fields-terminated-by '\t' --null-string 'This is a Null String'

exit 0;
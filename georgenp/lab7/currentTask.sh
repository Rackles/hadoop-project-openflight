sqoop import --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin --table Employees -m 2 --split-by eid --warehouse-dir /tmp/sqoop/Employees2 --fields-terminated-by '\t' --null-string 'This is a Null String'

exit 0;
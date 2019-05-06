sqoop export --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin -m 1 --table Employees --export-dir /tmp/sqoop/Employees --input-null-string 'This is a Null String'

exit 0;
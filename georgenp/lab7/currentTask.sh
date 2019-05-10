sqoop export --connect jdbc:mysql://$1/georgenpsqoop --username hive --password admin -m 1 --table Employees --export-dir /tmp/sqoop/Employees --input-null-string 'This is a Null String' --update-key eid --update-mode allowinsert

sqoop export --connect jdbc:mysql://10.128.0.7:3306/sqooptest --username hive -m 1 --table StudentsExportTest --export-dir /tmp/sqoop/Students --input-fields-terminated-by '\t' --input-null-string 'NULL String' --input-null-non-string '\\N' --update-key sid --update-mode allowinsert

exit 0;
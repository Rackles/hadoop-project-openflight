sqoop export --connect jdbc:mysql://10.128.0.4:3306/OpenAnalysis --username hive --password admin -m 1 --table MostAirports --export-dir /tmp/openflight/output/mostAirports/part-r-00000 --input-fields-terminated-by ',' --input-null-string '\\N' --input-null-non-string '\\N'

exit 0;
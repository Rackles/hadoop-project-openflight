sqoop export --connect jdbc:mysql://10.128.0.4:3306/OpenAnalysis --username hive --password admin -m 1 --table NorthAirports --export-dir /tmp/openflight/output/northairports/part-r-00000 --input-fields-terminated-by ',' --input-null-string '\\N' --input-null-non-string '\\N'

exit 0;
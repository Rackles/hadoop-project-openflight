sqoop export --connect jdbc:mysql://10.128.0.4:3306/OpenAnalysis --username hive --password admin -m 1 --table LongestRoutes --export-dir /tmp/openflight/output/longestRoutes/part-r-00000 --input-fields-terminated-by ',' --input-null-string '\\N' --input-null-non-string '\\N'

exit 0;
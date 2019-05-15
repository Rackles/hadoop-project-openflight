sqoop export --connect jdbc:postgresql://193.196.37.32:5432/openanalysis --username postgres --password admin -m 1 --table southairports --export-dir /tmp/openflight/output/southAirports/ --input-fields-terminated-by ',' --input-null-string '\\N' --input-null-non-string '\\N'

exit 0;

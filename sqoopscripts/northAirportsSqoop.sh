sqoop export --connect jdbc:postgresql://193.196.37.32:5432/openanalysis --username postgres --password admin -m 1 --table NorthAirports --export-dir /tmp/openflight/output/northAirports/part-r-00000 --input-fields-terminated-by ',' --input-null-string '\\N' --input-null-non-string '\\N'

exit 0;
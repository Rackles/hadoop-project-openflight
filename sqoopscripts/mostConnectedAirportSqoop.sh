sqoop export --connect jdbc:postgresql://193.196.37.32:5432/openanalysis --username postgres --password admin -m 1 --table MostConnectedAirport --export-dir /tmp/openflight/output/mostConnectedAirports/part-r-00000 --input-fields-terminated-by '\t' --input-null-string '\\N' --input-null-non-string '\\N'

exit 0;
sqoop export --connect jdbc:mysql://193.196.37.32:3306/OpenAnalysis --username root --password admin -m 1 --table MostConnectedAirportCountry --export-dir /tmp/openflight/output/mostConnectedAirportsCountry/part-r-00000 --input-fields-terminated-by '\t' --input-null-string '\\N' --input-null-non-string '\\N'

exit 0;
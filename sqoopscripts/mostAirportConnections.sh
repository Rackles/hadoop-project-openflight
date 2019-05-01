CREATE DATABASE IF NOT EXISTS OpenAnalysis;

USE OpenAnalysis;

CREATE TABLE MostConnectedAirports(airportID int, airportName varchar(50), connections int, UNIQUE KEY duplicateConstraint(airportID));

sqoop export --connect jdbc:mysql://10.128.0.4:3306/OpenAnalysis --username hive -m 1 --table MostConnectedAirports --export-dir /tmp/openflight/output/mostConnectedAirports/part-r-00000 --input-fields-terminated-by '\t' --input-null-string 'NULL String' --input-null-non-string '\\N' --update-key airportID --update-mode allowinsert -P
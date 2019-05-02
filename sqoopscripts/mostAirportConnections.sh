mysql -u root -e "CREATE DATABASE IF NOT EXISTS OpenAnalysis;
USE OpenAnalysis;
DROP TABLE IF EXISTS MostConnectedAirports;
CREATE TABLE MostConnectedAirports(airportID int, airportName varchar(50), connections int, UNIQUE KEY duplicateConstraint(airportID));"

exit 0;
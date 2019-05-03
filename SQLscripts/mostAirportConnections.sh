mysql -u root -e "CREATE DATABASE IF NOT EXISTS OpenAnalysis;
USE OpenAnalysis;
DROP TABLE IF EXISTS MostConnectedAirports;
CREATE TABLE MostConnectedAirports(airportID int, airportName varchar(150), connections int);"

exit 0;
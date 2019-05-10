mysql -u root -e "CREATE DATABASE IF NOT EXISTS OpenAnalysis;
USE OpenAnalysis;
DROP TABLE IF EXISTS MostConnectedAirport;
CREATE TABLE MostConnectedAirport(airportID int, airportName varchar(150), connections int, lat decimal, long decimal);"

exit 0;
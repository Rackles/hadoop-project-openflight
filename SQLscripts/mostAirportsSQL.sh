mysql -u root -e "CREATE DATABASE IF NOT EXISTS OpenAnalysis;
USE OpenAnalysis;
DROP TABLE IF EXISTS MostAirports;
CREATE TABLE MostAirports(country varchar(50), latitude decimal, longitude decimal, numberOfAirlines decimal);"

exit 0;
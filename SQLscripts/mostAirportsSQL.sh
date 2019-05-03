mysql -u root -e "CREATE DATABASE IF NOT EXISTS OpenAnalysis;
USE OpenAnalysis;
DROP TABLE IF EXISTS MostAirports;
CREATE TABLE MostAirports(country varchar(50), lat decimal, long decimal, numberOfAirlines decimal);"

exit 0;
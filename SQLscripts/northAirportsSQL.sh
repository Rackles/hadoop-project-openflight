mysql -u root -e "CREATE DATABASE IF NOT EXISTS OpenAnalysis;
USE OpenAnalysis;
DROP TABLE IF EXISTS NorthAirports;
CREATE TABLE NorthAirports(id varchar(10), name varchar(150), city varchar(50), country varchar(50), iata varchar(10), latitude decimal, longitude decimal);"

exit 0;
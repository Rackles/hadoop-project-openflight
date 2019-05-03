mysql -u root -e "CREATE DATABASE IF NOT EXISTS OpenAnalysis;
USE OpenAnalysis;
DROP TABLE IF EXISTS MostConnectedAirportCountry;
CREATE TABLE MostConnectedAirportCountry(id varchar(10), name varchar(150), count int, lat decimal, long decimal);"

exit 0;
mysql -u root -e "CREATE DATABASE IF NOT EXISTS OpenAnalysis;
USE OpenAnalysis;
DROP TABLE IF EXISTS MostAirlines;
CREATE TABLE MostAirlines(country varchar(50), numberOfAirlines decimal);"

exit 0;
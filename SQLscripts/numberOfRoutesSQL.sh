mysql -u root -e "CREATE DATABASE IF NOT EXISTS OpenAnalysis;
USE OpenAnalysis;
DROP TABLE IF EXISTS NumberOfRoutes;
CREATE TABLE NumberOfRoutes(airID varchar(10), iata varchar(10), airlineName varchar(150), total int);"

exit 0;
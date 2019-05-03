mysql -u root -e "CREATE DATABASE IF NOT EXISTS OpenAnalysis;
USE OpenAnalysis;
DROP TABLE IF EXISTS HighAltitudes;
CREATE TABLE HighAltitudes(id varchar(10), name varchar(150), city varchar(50), country varchar(50), iata varchar(10), alt decimal, latitude decimal, longitude decimal);"

exit 0;
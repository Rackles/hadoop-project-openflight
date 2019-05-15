psql -h 193.196.37.32 -p 5432 -d openanalysis -U postgres -w -c "CREATE DATABASE IF NOT EXISTS OpenAnalysis;
USE OpenAnalysis;
DROP TABLE IF EXISTS HighAltitudes2;
CREATE TABLE HighAltitudes2(id varchar(10), name varchar(150), city varchar(50), country varchar(50), iata varchar(10), alt decimal, latitude decimal, longitude decimal);"

exit 0;
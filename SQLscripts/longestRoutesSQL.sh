mysql -u root -e "CREATE DATABASE IF NOT EXISTS OpenAnalysis;
USE OpenAnalysis;
DROP TABLE IF EXISTS LongestRoutes;
CREATE TABLE LongestRoutes(sname varchar(150), dname varchar(150), sLat decimal, sLong decimal, dLat decimal, dLong decimal, distance decimal);"

exit 0;
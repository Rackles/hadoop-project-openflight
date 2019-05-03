mysql -u root -e "CREATE DATABASE IF NOT EXISTS OpenAnalysis;
USE OpenAnalysis;
DROP TABLE IF EXISTS LongestRoutes;
CREATE TABLE LongestRoutes(sname varchar(150), dname varchar(150), sLat decimal, sLong decimal, dLat decimal, dLong decimal, distance  sname, dname, sLat, sLong, dLat, dLong, edu.rosehulman.openanalytics.CalcDistance(sLat, sLong, dLat, dLong) AS distance);"

exit 0;
mysql -u root -e "CREATE DATABASE IF NOT EXISTS OpenAnalysis;
USE OpenAnalysis;
DROP TABLE IF EXISTS DistancesByPlane;
CREATE TABLE DistancesByPlane(planeIATA varchar(10), max decimal, avg decimal, min decimal, count int);"

exit 0;
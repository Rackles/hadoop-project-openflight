psql -h 193.196.37.32 -p 5432 -d openanalysis -U postgres -w -c "DROP TABLE IF EXISTS LongestRoutes;
CREATE TABLE LongestRoutes(sname varchar(150), dname varchar(150), sLat decimal, sLong decimal, dLat decimal, dLong decimal, distance decimal);"

exit 0;
psql -h 193.196.37.32 -p 5432 -d openanalysis -U postgres -w -c "DROP TABLE IF EXISTS NumberOfRoutes;
CREATE TABLE NumberOfRoutes(airID varchar(10), iata varchar(10), airlineName varchar(150), total int);"

exit 0;
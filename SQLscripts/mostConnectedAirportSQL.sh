psql -h 193.196.37.32 -p 5432 -d openanalysis -U postgres -w -c "DROP TABLE IF EXISTS MostConnectedAirport;
CREATE TABLE MostConnectedAirport(airportID int, airportName varchar(150), connections int, latitude decimal, longitude decimal);"

exit 0;
psql -h 193.196.37.32 -p 5432 -d openanalysis -U postgres -w -c "DROP TABLE IF EXISTS MostAirports;
CREATE TABLE MostAirports(country varchar(50), latitude decimal, longitude decimal, numberOfAirlines decimal);"

exit 0;
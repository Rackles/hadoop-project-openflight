psql -h 193.196.37.32 -p 5432 -d openanalysis -U postgres -w -c "DROP TABLE IF EXISTS MostConnectedAirportCountry;
CREATE TABLE MostConnectedAirportCountry(id varchar(10), name varchar(150), count int, latitude decimal, longitude decimal);"

exit 0;
psql -h 193.196.37.32 -p 5432 -d openanalysis -U postgres -w -c "DROP TABLE IF EXISTS MostAirlines;
CREATE TABLE MostAirlines(country varchar(50), numberOfAirlines decimal);"

exit 0;
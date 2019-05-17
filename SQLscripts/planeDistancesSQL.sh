psql -h 193.196.37.32 -p 5432 -d openanalysis -U postgres -w -c "DROP TABLE IF EXISTS planedistances;
CREATE TABLE planedistances(planeIATA varchar(10), max decimal, avg decimal, min decimal, count int);"

exit 0;
$ hdfs dfs -mkdir airports
$ hdfs dfs -put airports.dat airports

$ hdfs dfs -mkdir airlines
$ hdfs dfs -put airlines.dat airlines

$ hdfs dfs -mkdir planes
$ hdfs dfs -put planes.dat planes

$ hdfs dfs -mkdir routes
$ hdfs dfs -put routes.dat routes

CREATE EXTERNAL TABLE IF NOT EXISTS Airports_dat(
AirportID INT, AirportName STRING, City STRING,
Country STRING, IATA STRING, ICAO STRING, Latitude DOUBLE, Longitude DOUBLE, Altitude INT, 
Timezone DOUBLE, DST CHAR(10), Tz STRING, AirportType STRING, Source STRING)
COMMENT 'Airports'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/tmp/openflight/database/airports';

LOAD DATA INPATH '/tmp/openflight/airports.dat' OVERWRITE INTO TABLE Airports_dat;

CREATE TABLE IF NOT EXISTS Airports(
AirportID INT, AirportName STRING, City STRING,
Country STRING, IATA STRING, ICAO STRING, Latitude DOUBLE, Longitude DOUBLE, Altitude INT,
Timezone DOUBLE, DST CHAR(10), Tz STRING, AirportType STRING, Source STRING)    
COMMENT 'Airports'
STORED AS ORC;

INSERT OVERWRITE TABLE Airports SELECT * FROM Airports_dat;

CREATE EXTERNAL TABLE IF NOT EXISTS Airlines_dat(
AirlineID INT, AirlineName STRING, Alias STRING,
IATA STRING, ICAO STRING, Callsign STRING, Country STRING, Active CHAR(10))
COMMENT 'Airlines'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/tmp/openflight/database/airlines';

LOAD DATA INPATH '/tmp/openflight/airlines.dat' OVERWRITE INTO TABLE Airlines_dat;

CREATE TABLE IF NOT EXISTS Airlines(
AirlineID INT, AirlineName STRING, Alias STRING,
IATA STRING, ICAO STRING, Callsign STRING, Country STRING, Active CHAR(10))
COMMENT 'Airlines'   
STORED AS ORC;

INSERT OVERWRITE TABLE Airlines SELECT * FROM Airlines_dat;

CREATE EXTERNAL TABLE IF NOT EXISTS Planes_dat(
PlaneName STRING, IATA STRING, ICAO STRING)
COMMENT 'Plane'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/tmp/openflight/database/planes';

LOAD DATA INPATH '/tmp/openflight/planes.dat' OVERWRITE INTO TABLE Planes_dat;

CREATE TABLE IF NOT EXISTS Planes(
PlaneName STRING, IATA STRING, ICAO STRING)
COMMENT 'Planes'
STORED AS ORC;

INSERT OVERWRITE TABLE Planes SELECT * FROM Planes_dat;

CREATE EXTERNAL TABLE IF NOT EXISTS Routes_dat(
Airline STRING, AirlineID INT, 
Destination STRING, DestinationID INT, Codeshare CHAR(10), Stops INT, Equipment STRING)
COMMENT 'Routes'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/tmp/openflight/database/routes';

LOAD DATA INPATH '/tmp/openflight/routes.dat' OVERWRITE INTO TABLE Routes_dat;

CREATE TABLE IF NOT EXISTS Routes(
Airline STRING, AirlineID INT, 
Destination STRING, DestinationID INT, Codeshare CHAR(10), Stops INT, Equipment STRING)
COMMENT 'Routes'
STORED AS ORC;

INSERT OVERWRITE TABLE Routes SELECT * FROM Routes_dat;
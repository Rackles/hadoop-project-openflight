$ hdfs dfs -mkdir airports
$ hdfs dfs -put airports.dat airports

$ hdfs dfs -mkdir airlines
$ hdfs dfs -put airlines.dat airlines

$ hdfs dfs -mkdir planes
$ hdfs dfs -put planes.dat planes

$ hdfs dfs -mkdir routes
$ hdfs dfs -put routes.dat routes

hive> CREATE EXTERNAL TABLE IF NOT EXISTS Airports_dat(
    > AirportID INT, AirportName STRING, City STRING,
    > Country STRING, IATA STRING, ICAO STRING, Latitude DOUBLE, Longitude DOUBLE, Altitude INT, 
    > Timezone DOUBLE, DST CHAR, Tz STRING, Type STRING, Source STRING)
    > COMMENT 'Airports'
    > ROW FORMAT DELIMITED
    > FIELDS TERMINATED BY ','
    > STORED AS DAT
    > LOCATION '/tmp/openflight';
OK

hive> CREATE TABLE IF NOT EXISTS Airports(
    > AirportID INT, AirportName STRING, City STRING,
    > Country STRING, IATA STRING, ICAO STRING, Latitude DOUBLE, Longitude DOUBLE, Altitude INT,
    > Timezone DOUBLE, DST CHAR, Tz STRING, Type STRING, Source STRING)    
    > COMMENT 'Airports'
    > STORED AS TEXTFILE;
OK

hive> INSERT OVERWRITE TABLE Airports SELECT * FROM Airports_dat;


hive> CREATE EXTERNAL TABLE IF NOT EXISTS Airlines_dat(
    > AirlineID INT, AirlineName STRING, Alias STRING,
    > IATA STRING, ICAO STRING, Callsign STRING, Country STRING, Active CHAR
    > COMMENT 'Airlines'
    > ROW FORMAT DELIMITED
    > FIELDS TERMINATED BY ','
    > STORED AS DAT
    > LOCATION '/tmp/openflight';
OK

hive> CREATE TABLE IF NOT EXISTS Airlines(
    > AirlineID INT, AirlineName STRING, Alias STRING,
    > IATA STRING, ICAO STRING, Callsign STRING, Country STRING, Active CHAR
    > COMMENT 'Airlines'   
    > STORED AS TEXTFILE;
OK

hive> INSERT OVERWRITE TABLE Airlines SELECT * FROM Airlines_dat;



hive> CREATE EXTERNAL TABLE IF NOT EXISTS Planes_dat(
    > PlaneName STRING, IATA STRING, ICAO STRING
    > COMMENT 'Plane'
    > ROW FORMAT DELIMITED
    > FIELDS TERMINATED BY ','
    > STORED AS DAT
    > LOCATION '/tmp/openflight';
OK

hive> CREATE TABLE IF NOT EXISTS Planes(
    > PlaneName STRING, IATA STRING, ICAO STRING   
    > COMMENT 'Planes'
    > STORED AS TEXTFILE;
OK

hive> INSERT OVERWRITE TABLE Planes SELECT * FROM Planes_dat;


hive> CREATE EXTERNAL TABLE IF NOT EXISTS Routes_dat(
    > Airline STRING, AirlineID INT, 
    > Destination STRING, DestinationID INT, Codeshare CHAR, Stops INT, Equipment STRING
    > COMMENT 'Routes'
    > ROW FORMAT DELIMITED
    > FIELDS TERMINATED BY ','
    > STORED AS DAT
    > LOCATION '/tmp/openflight';
OK

hive> CREATE TABLE IF NOT EXISTS Routes(
    > Airline STRING, AirlineID INT, 
    > Destination STRING, DestinationID INT, Codeshare CHAR, Stops INT, Equipment STRING
    > COMMENT 'Routes'
    > STORED AS TEXTFILE;
OK

hive> INSERT OVERWRITE TABLE Routes SELECT * FROM Routes_dat;
records = LOAD 'airports' USING org.apache.hive.hcatalog.pig.HCatLoader();
countries = GROUP records BY country;
numOfAirports = FOREACH countries  GENERATE group, COUNT(records.airportid) AS NumberOfAirports;
STORE numOfAirports INTO 'NumberOfAirports' USING org.apache.hive.hcatalog.pig.HCatStorer();
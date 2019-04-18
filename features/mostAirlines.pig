records = LOAD 'airlines' USING org.apache.hive.hcatalog.pig.HCatLoader();
countries = GROUP records BY country;
numOfAirports = FOREACH countries  GENERATE group, COUNT(records.airlineid) AS NumberOfAirports;
STORE numOfAirports INTO 'NumberOfAirports' USING org.apache.hive.hcatalog.pig.HCatStorer();
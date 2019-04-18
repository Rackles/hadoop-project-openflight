CREATE TABLE NumberOfAirports AS
SELECT air.country, MAX(count) FROM (
SELECT country, COUNT(*) AS count 
FROM Airports_dat
GROUP BY country) air;
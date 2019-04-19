CREATE TABLE NumberOfAirlines AS
SELECT country, COUNT(*) AS numberOfAirlines
FROM Airlines_dat GROUP BY country;
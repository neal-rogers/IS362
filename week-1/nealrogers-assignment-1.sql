-- The query below retrieves the count of all rows in the planes table with recorded speeds for aircraft.

SELECT COUNT(*)
FROM planes
WHERE speed IS NOT NULL;

-- The query below retrieves the minimum and maximum speeds for all records in the planes table.

SELECT MIN(speed) AS 'Minimum Speed',
MAX(speed) AS 'Maximum Speed'
FROM planes
WHERE speed IS NOT NULL;

-- The query below calculates the total distance for all records in January 2013 within the flights table.

SELECT SUM(distance) AS 'Total Distance'
FROM flights
WHERE month = '1'
AND year = '2013';

-- The query below calculates the total distance for all records in January 2013 where the tailnum field is NULL within the flights table.

SELECT SUM(distance) AS 'Total Distance'
FROM flights
WHERE month = '1'
AND year = '2013'
AND tailnum IS NULL;

-- The query below joins the planes and flights tables, calculates the total distance flown for each flight on July 5, 2013, and groups results by manufacturer.

SELECT p.manufacturer AS 'Manufacturer',
SUM(distance) AS 'Total Distance'
FROM flights f
JOIN planes p
ON f.tailnum = p.tailnum
WHERE f.month = '7'
AND f.day = '5'
AND f.year = '2013'
GROUP BY p.manufacturer;

-- The query below joins the planes and flights tables, calculates the total distance flown for each flight on July 5, 2013, and groups results by manufacturer - (using a LEFT JOIN) including rows without recorded manufacturers.

SELECT p.manufacturer AS 'Manufacturer',
SUM(distance) AS 'Total Distance'
FROM flights f
LEFT JOIN planes p
ON f.tailnum = p.tailnum
WHERE f.month = '7'
AND f.day = '5'
AND f.year = '2013'
GROUP BY p.manufacturer;

-- The query below ...

SELECT w.temp AS "Temperature',
f.flight AS 'Flight Number'
FROM weather w
WHERE temp IN
(SELECT temp
FROM weather
WHERE temp <= 32.00)
JOIN flights f
ON w.origin = f.origin
;

SELECT *
FROM flights;

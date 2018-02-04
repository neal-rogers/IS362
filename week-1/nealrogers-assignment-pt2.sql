-- The query below calculates the average air time by tail number, model, and manufacturer for the entire month of October.

SELECT IFNULL(f.tailnum, 'None') AS 'Tail Number',
p.model AS 'Model',
p.manufacturer AS 'Manufacturer',
AVG(IFNULL(f.arr_time, 0)) AS 'Air Time (AVG)'
FROM flights f
JOIN planes p
ON f.tailnum = p.tailnum
WHERE month = '10'
GROUP BY f.tailnum
ORDER BY AVG(f.arr_time), p.model;
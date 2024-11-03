SELECT ROUND(MAX(lat_n), 4) AS max_lat_n
FROM station
WHERE lat_n < 137.2345;
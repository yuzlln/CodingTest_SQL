SELECT ROUND(MIN(lat_n), 4) AS min_lat_n
FROM station
WHERE lat_n > 38.7780;
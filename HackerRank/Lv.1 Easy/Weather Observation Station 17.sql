SELECT ROUND(long_w, 4) AS long_W
FROM station
WHERE lat_n IN (SELECT MIN(lat_n)
                FROM station
                WHERE lat_n > 38.7780
                );
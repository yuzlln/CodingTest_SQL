SELECT ROUND(SUM(lat_n), 2) AS sum_lat
    , ROUND(SUM(long_w), 2) AS sum_long
FROM station;
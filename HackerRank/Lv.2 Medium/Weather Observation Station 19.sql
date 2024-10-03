WITH distance AS (
    SELECT MIN(lat_n) AS a
        , MAX(lat_n) AS b
        , MIN(long_w) AS c
        , MAX(long_w) AS d
    FROM station
)

SELECT ROUND(SQRT(POWER((b - a), 2) + POWER((d - c), 2)), 4) AS dist -- Euclidean Distance
FROM distance;
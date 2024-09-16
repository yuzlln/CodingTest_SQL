WITH distance AS (
    SELECT MIN(lat_n) AS a
        , MIN(long_w) AS b
        , MAX(lat_n) AS c
        , MAX(long_w) AS d
    FROM station
)

SELECT ROUND(ABS(a - c) + ABS(b - d), 4) AS dis -- Manhattan Distance = ∣p1−q1∣+∣p2−q2∣
FROM distance;
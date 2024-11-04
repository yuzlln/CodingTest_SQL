WITH single AS (
    SELECT num
        , COUNT(*) AS cnt
    FROM mynumbers
    GROUP BY num
    HAVING cnt = 1
)

SELECT MAX(num) AS num
FROM single;
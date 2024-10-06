-- step 1) X1 = Y1인 경우
SELECT x
    , y
FROM functions
GROUP BY x
    , y
HAVING COUNT(*) >= 2

UNION ALL

-- step 2) X1 ≠ Y1인 경우
SELECT f1.x
    , f1.y
FROM functions AS f1
    INNER JOIN functions AS f2 ON f1.x = f2.y
        AND f1.y = f2.x
WHERE f1.x < f1.y
ORDER BY x;
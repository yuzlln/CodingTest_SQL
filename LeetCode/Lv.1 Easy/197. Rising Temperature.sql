-- 방법 1) DATEDIFF
SELECT w2.id  -- 더 높은 temperature의 id이므로 w2.id
FROM weather AS w
    LEFT JOIN weather AS w2 ON DATEDIFF(w2.recorddate, w.recorddate) = 1
WHERE w.temperature < w2.temperature;



-- 방법 2) DATE_ADD
SELECT w2.id
FROM weather AS w
    LEFT JOIN weather AS w2 ON DATE_ADD(w.recorddate, INTERVAL 1 DAY) = w2.recorddate
WHERE w.temperature < w2.temperature;
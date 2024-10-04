-- 방법 1) 서브쿼리
SELECT ROUND(long_w, 4)
FROM station
WHERE lat_n IN (SELECT MAX(lat_n)
                FROM station
                WHERE lat_n < 137.2345
                );
                
                
                
-- 방법 2) ORDER BY & LIMIT
SELECT ROUND(long_w, 4)
FROM station
WHERE lat_n < 137.2345
ORDER BY lat_n DESC
LIMIT 1;
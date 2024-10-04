-- 방법 1) WHERE절
SELECT HOUR(datetime) AS hour -- datetime 타입이 'datetime'일때 시간만 추출
    , COUNT(*) AS count
FROM animal_outs
WHERE HOUR(datetime) BETWEEN 9 AND 20
GROUP BY hour
ORDER BY hour;



-- 방법 2) HAVING절
SELECT HOUR(datetime) AS hour
    , COUNT(*) AS count
FROM animal_outs
GROUP BY hour
HAVING hour BETWEEN 9 AND 20
ORDER BY hour;
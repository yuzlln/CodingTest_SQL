-- 방법 1) 오름차순으로 repeat
SET @num := 0;

SELECT REPEAT('* ', @num := @num + 1) AS stars -- REPEAT 함수 
FROM information_schema.tables
WHERE @num < 20
ORDER BY stars DESC;



-- 방법 2) 내림차순으로 repeat
SET @num := 21;

SELECT REPEAT('* ', @num := @num - 1) AS stars
FROM information_schema.tables
LIMIT 20;
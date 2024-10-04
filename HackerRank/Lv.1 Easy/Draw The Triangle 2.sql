SET @num := 0;

SELECT REPEAT('* ', @num := @num + 1) AS stars
FROM information_schema.tables
WHERE @num <= 19
ORDER BY stars;
-- 방법 1)
SELECT DISTINCT city
FROM station
WHERE LEFT(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u');



-- 방법 2)
SELECT DISTINCT city
FROM station
WHERE NOT (city LIKE 'a%'
            OR city LIKE 'e%'
            OR city LIKE 'i%'
            OR city LIKE 'o%'
            OR city LIKE 'u%'
           );
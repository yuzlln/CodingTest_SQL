-- 방법 1) 와일드키
SELECT DISTINCT city
FROM station
WHERE RIGHT(city, 1) IN ('a', 'e', 'i', 'o', 'u')
    AND LEFT(city, 1) IN ('a', 'e', 'i', 'o', 'u');



-- 방법 2) 정규 표현식
SELECT DISTINCT city
FROM station
WHERE city REGEXP '^[aeiou].*[aeiou]$';

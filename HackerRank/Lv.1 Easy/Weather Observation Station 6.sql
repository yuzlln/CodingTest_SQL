-- 방법 1) 와일드키
SELECT DISTINCT city
FROM station
WHERE city LIKE 'a%'
    OR city LIKE 'e%'
    OR city LIKE 'i%'
    OR city LIKE 'o%'
    OR city LIKE 'u%';



-- 방법 2) 정규 표현식(Regular Expression)
SELECT DISTINCT city
FROM station
WHERE LEFT(city, 1) REGEXP 'a|e|i|o|u';



-- 방법 3) 정규 표현식
 -- ^ : 문자열의 시작
 -- .* : 0개 이상의 어떤 문자든 일치
SELECT DISTINCT city
FROM station
WHERE city REGEXP '^[a, e, i, o, u].*'; 



-- 방법 4) 정규 표현식
SELECT DISTINCT city
FROM station
WHERE city REGEXP '^[aeiou].*';
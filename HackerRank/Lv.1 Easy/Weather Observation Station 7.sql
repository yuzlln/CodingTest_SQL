-- 방법 1) 와일드키
SELECT DISTINCT city
FROM station
WHERE city LIKE '%a'
    OR city LIKE '%e'
    OR city LIKE '%i'
    OR city LIKE '%o'
    OR city LIKE '%u';



-- 방법 2) 정규 표현식
SELECT DISTINCT city
FROM station
WHERE city REGEXP '.*[aeiou]$';
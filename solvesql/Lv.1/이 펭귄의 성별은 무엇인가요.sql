-- 방법 1) IF문
SELECT COUNT(*) AS total
  , SUM(IF(sex IS NOT NULL, 1, 0)) AS sex_notnull
  , SUM(IF(sex IS NULL, 1, 0)) AS sex_null
FROM penguins;



-- 방법 2) 집계함수
SELECT COUNT(*) AS total
  , COUNT(sex) AS sex_notnull
  , COUNT(*) - COUNT(sex) AS sex_null
FROM penguins;
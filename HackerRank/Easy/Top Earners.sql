-- 방법 1) WHERE절 서브쿼리
SELECT months * salary AS earnings
    , COUNT(*) AS cnt
FROM employee
WHERE months * salary = (SELECT MAX(months * salary)
			 FROM employee
                         )
GROUP BY earnings;


-- 방법 2) HAVING절 서브쿼리
SELECT months * salary AS earnings
    , COUNT(*) AS cnt
FROM employee
GROUP BY earnings
HAVING earnings = (SELECT MAX(months * salary)
                   FROM employee
                   );

-- 방법 1) WHERE절 서브쿼리
SELECT d.name AS Department
    , e.name AS Employee
    , e.salary AS Salary
FROM employee AS e
    LEFT JOIN department AS d ON e.departmentid = d.id
WHERE (e.departmentid, e.salary) IN (SELECT departmentid
                                         , MAX(salary)
                                     FROM employee
                                     GROUP BY departmentid
                                     );
                                     
                                     

-- 방법 2) FROM절 서브쿼리
SELECT d.name AS Department
    , e.name AS Employee
    , e.salary AS Salary
FROM employee AS e
    INNER JOIN (SELECT departmentid
                    , MAX(salary) AS max_salary
                FROM employee
                GROUP BY departmentid
                ) AS eh ON e.departmentid = eh.departmentid
                            AND e.salary = eh.max_salary
    INNER JOIN department AS d ON e.departmentid = d.id;
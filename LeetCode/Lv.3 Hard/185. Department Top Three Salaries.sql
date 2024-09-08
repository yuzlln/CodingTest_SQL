WITH high_earner AS (
    SELECT d.name AS Department
        , e.name AS Employee
        , e.salary AS Salary
        , DENSE_RANK() OVER(PARTITION BY departmentid ORDER BY salary DESC) AS num
    FROM employee AS e
        LEFT JOIN department AS d ON e.departmentid = d.id
)
SELECT Department
    , Employee
    , Salary
FROM high_earner
WHERE num <= 3
ORDER BY Department;
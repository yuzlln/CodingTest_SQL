SELECT d.dept_id
    , d.dept_name_en
    , ROUND(AVG(sal), 0) AS avg_sal
FROM hr_employees AS e
    INNER JOIN hr_department AS d ON e.dept_id = d.dept_id
GROUP BY d.dept_id
    , d.dept_name_en
ORDER BY avg_sal DESC;
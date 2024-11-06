WITH total_employees AS (
    SELECT employee_id
    FROM employees

    UNION

    SELECT employee_id
    FROM salaries
)

SELECT t.employee_id
FROM total_employees AS t
    LEFT JOIN employees AS e ON t.employee_id = e.employee_id
    LEFT JOIN salaries AS s ON t.employee_id = s.employee_id
WHERE e.employee_id IS NULL
    OR s.employee_id IS NULL
ORDER BY t.employee_id;
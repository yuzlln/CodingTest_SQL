SELECT e.employee_id
  , e.name
  , m.employee_id AS manager_id
  , m.name AS manager_name
FROM employees AS e
  INNER JOIN employees AS m ON e.manager_id = m.employee_id
ORDER BY e.employee_id;
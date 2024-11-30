WITH mentee AS ( -- 멘티
  SELECT *
  FROM employees
  WHERE join_date BETWEEN '2021-10-01' AND '2021-12-31'
)
, mentor AS ( -- 멘토
SELECT *
FROM employees
WHERE join_date <= '2020-01-01'
)

SELECT e.employee_id AS mentee_id
  , e.name AS mentee_name
  , r.employee_id AS mentor_id
  , r.name AS mentor_name
FROM mentee AS e
  CROSS JOIN mentor AS r
WHERE e.department != r.department
ORDER BY mentee_id
  , mentor_id;
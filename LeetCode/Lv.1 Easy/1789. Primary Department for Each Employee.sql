WITH primary_dep AS ( -- primary department를 가진 employee_id
    SELECT DISTINCT employee_id
    FROM employee
    WHERE primary_flag = 'Y'
)

-- 선호 부서가 없는 직원의 depart_ment_id
SELECT employee_id
    , department_id
FROM employee
WHERE employee_id NOT IN (SELECT  *
                          FROM primary_dep
                          )

UNION ALL

-- 선호 부서가 있는 직원의 depart_ment_id
SELECT employee_id
    , department_id
FROM employee
WHERE employee_id IN (SELECT  *
                      FROM primary_dep
                      )
    AND primary_flag = 'Y';
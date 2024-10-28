WITH grade AS ( -- 사원별 2022년 한해 평가 점수
    SELECT emp_no
        , SUM(score) AS score
    FROM hr_grade
    GROUP BY emp_no
)
, max_grade AS ( -- 2022년 한해 평가 점수가 제일 높은 사원
    SELECT *
    FROM grade
    WHERE score = (SELECT MAX(score)
                   FROM grade
                   )
)
SELECT g.score
    , g.emp_no
    , e.emp_name
    , e.position
    , e.email
FROM max_grade AS g
    INNER JOIN hr_employees AS e ON g.emp_no = e.emp_no
    INNER JOIN hr_department AS d ON e.dept_id = d.dept_id;
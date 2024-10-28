WITH emp_grade AS ( -- 사원별 평가 점수 평균
    SELECT emp_no
        , AVG(score) AS score
    FROM hr_grade
    GROUP BY emp_no
)
, grade AS ( -- 평가등급
    SELECT *
        , CASE WHEN score >= 96 THEN 'S'
               WHEN score >= 90 THEN 'A'
               WHEN score >= 80 THEN 'B'
               ELSE 'C' END AS grade
    FROM emp_grade
)

SELECT g.emp_no
    , e.emp_name
    , g.grade
    , CASE WHEN g.grade = 'S' THEN e.sal * 0.2
           WHEN g.grade = 'A' THEN e.sal * 0.15
           WHEN g.grade = 'B' THEN e.sal * 0.1
           ELSE 0 END AS bonus
FROM grade AS g
    INNER JOIN hr_employees AS e ON g.emp_no = e.emp_no
    INNER JOIN hr_department AS d ON e.dept_id = d.dept_id
ORDER BY g.emp_no;
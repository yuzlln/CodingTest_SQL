-- 방법1)
WITH students_subjects AS ( -- 모든 학생과 과목의 조합
    SELECT *
    FROM students AS s
        CROSS JOIN subjects AS subj
)

SELECT ss.student_id
    , ss.student_name
    , ss.subject_name
    , COALESCE(COUNT(e.subject_name), 0) AS attended_exams
FROM students_subjects AS ss
    LEFT JOIN examinations AS e ON ss.student_id = e.student_id
        AND ss.subject_name = e.subject_name
GROUP BY ss.student_id
    , ss.student_name
    , ss.subject_name
ORDER BY ss.student_id
    , ss.subject_name;



-- 방법2)
WITH total AS ( -- 모든 학생과 과목의 조합
    SELECT *
    FROM students AS t
        CROSS JOIN subjects AS s
)
, examinations_cnt AS ( -- 학생들의 과목별 시험 수
    SELECT student_id
        , subject_name
        , COUNT(*) AS attended_exams
    FROM examinations
    GROUP BY student_id
        , subject_name
)

SELECT t.student_id
    , t.student_name
    , t.subject_name
    , COALESCE(e.attended_exams, 0) AS attended_exams
FROM total AS t
    LEFT JOIN examinations_cnt AS e ON t.student_id = e.student_id
        AND t.subject_name = e.subject_name
ORDER BY t.student_id
    , t.subject_name;
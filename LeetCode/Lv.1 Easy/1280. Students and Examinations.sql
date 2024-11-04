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
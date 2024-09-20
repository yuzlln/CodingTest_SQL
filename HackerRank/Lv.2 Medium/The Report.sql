SELECT IF(g.grade >= 8, s.name, NULL) AS name
    , g.grade
    , s.marks
FROM students AS s
    INNER JOIN grades AS g ON s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY g.grade DESC
    , s.name
    , s.marks;
WITH PARENT AS ( -- 부모 개체 수
    SELECT parent_id
        , COUNT(*) AS cnt
    FROM ecoli_data
    GROUP BY parent_id
)

SELECT e.id
    , COALESCE(p.cnt, 0) AS child_count
FROM ecoli_data AS e
    LEFT JOIN parent AS p ON e.id = p.parent_id
ORDER BY e.id;
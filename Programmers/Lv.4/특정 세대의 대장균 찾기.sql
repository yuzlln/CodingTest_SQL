WITH g1 AS ( -- 1세대
    SELECT *
    FROM ecoli_data
    WHERE parent_id IS NULL
)
, g2 AS ( -- 2세대
    SELECT *
    FROM ecoli_data
    WHERE parent_id IN (SELECT id
                        FROM g1
                       )
)
, g3 AS ( -- 3세대
    SELECT *
    FROM ecoli_data
    WHERE parent_id IN (SELECT id
                        FROM g2
                       )
)

SELECT id
FROM g3
ORDER BY id;
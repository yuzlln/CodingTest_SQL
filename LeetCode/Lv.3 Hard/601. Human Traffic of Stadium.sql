WITH stadium_group AS ( -- 연속된 id를 가진 행은 id_group이 동일
    SELECT *
        , id - ROW_NUMBER() OVER(ORDER BY id) AS id_group
    FROM stadium
    WHERE people >= 100
)
, stadium_filter AS ( -- 3개 이상의 id_group을 가진 id
    SELECT id
    FROM stadium_group
    WHERE id_group IN (SELECT id_group
                        FROM stadium_group
                        GROUP BY id_group
                        HAVING COUNT(*) >= 3
                        )
)

SELECT *
FROM stadium
WHERE id IN (SELECT *
             FROM stadium_filter
             )
ORDER BY visit_date;
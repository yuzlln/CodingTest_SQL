WITH percent AS ( -- 대장균 개체의 크기별 백분율
    SELECT *
        , 100 * ROW_NUMBER() OVER(ORDER BY size_of_colony DESC) / COUNT(*) OVER() AS ratio
    FROM ecoli_data
)

SELECT id
    , CASE WHEN ratio <= 25 THEN 'CRITICAL'
           WHEN ratio <= 50 THEN 'HIGH'
           WHEN ratio <= 75 THEN 'MEDIUM'
           ELSE 'LOW' END AS colony_name
FROM percent
ORDER BY id;
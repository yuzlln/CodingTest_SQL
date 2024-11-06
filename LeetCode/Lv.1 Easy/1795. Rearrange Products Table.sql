WITH num AS ( -- 인덱스 테이블 생성
    SELECT 'store1' AS idx
    UNION ALL SELECT 'store2' AS idx
    UNION ALL SELECT 'store3' AS idx
)
, result AS ( -- 열 행 변환 테이블
    SELECT p.product_id
        , n.idx AS store
        , CASE WHEN n.idx = 'store1' THEN p.store1
            WHEN n.idx = 'store2' THEN p.store2
            ELSE p.store3 END AS price 
    FROM products AS p
        CROSS JOIN num AS n
    ORDER BY n.idx
        , p.product_id
)

SELECT *
FROM result
WHERE price IS NOT NULL;
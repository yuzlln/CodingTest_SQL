WITH idx AS ( -- 인덱스 테이블 생성
    SELECT 'store1' AS store
    UNION ALL SELECT 'store2' AS store
    UNION ALL SELECT 'store3' AS store
)
, results AS ( -- 열 행 변환 테이블
    SELECT p.product_id
        , i.store
        , CASE WHEN i.store = 'store1' THEN p.store1
               WHEN i.store = 'store2' THEN p.store2
               ELSE p.store3 END AS price
    FROM products AS p
        CROSS JOIN idx AS i
)

SELECT *
FROM results
WHERE price IS NOT NULL;
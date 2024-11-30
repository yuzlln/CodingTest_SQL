WITH changes AS ( -- 2019년 8월 16일 이전에 변경된 적이 있는 상품
    SELECT product_id
        , MAX(change_date) AS date
    FROM products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)
, change_product AS ( -- 변경된 상품의 최신 가격 정보
    SELECT product_id
        , new_price
    FROM products
    WHERE (product_id, change_date) IN (SELECT *
                                        FROM changes
                                        )
)

SELECT DISTINCT p.product_id
    , COALESCE(c.new_price, 10) AS price
FROM products AS p
    LEFT JOIN change_product AS c ON p.product_id = c.product_id;
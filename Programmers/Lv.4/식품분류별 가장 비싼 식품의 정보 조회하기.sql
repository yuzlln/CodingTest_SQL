-- 방법 1) WHERE절 서브쿼리
SELECT category
    , price AS max_price
    , product_name
FROM food_product
WHERE (category, price) IN (SELECT category
                                , MAX(price)
                            FROM food_product
                            WHERE category IN ('과자','국', '김치', '식용유')
                            GROUP BY category
                            )
ORDER BY max_price DESC;


-- 방법 2) Window Function
SELECT category
    , price AS max_price
    , product_name
FROM (SELECT *
          , ROW_NUMBER() OVER(PARTITION BY category ORDER BY price DESC) AS num
      FROM food_product
      WHERE category IN ('과자', '국', '김치', '식용유')
     ) AS t
WHERE num = 1
ORDER BY max_price DESC;
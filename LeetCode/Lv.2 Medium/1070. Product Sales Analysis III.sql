WITH number AS (
    SELECT *
        , RANK() OVER (PARTITION BY product_id ORDER BY year) AS num
    FROM sales
)

SELECT product_id
    , year AS first_year
    , quantity
    , price
FROM number 
WHERE num = 1;
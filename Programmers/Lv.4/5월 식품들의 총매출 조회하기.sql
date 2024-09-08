SELECT p.product_id
    , p.product_name
    , SUM(p.price * o.amount) AS total_sales
FROM food_order AS o
    INNER JOIN food_product AS p ON o.product_id = p.product_id
WHERE DATE_FORMAT(o.produce_date, '%Y-%m') = '2022-05'
GROUP BY p.product_id
    , p.product_name
ORDER BY total_sales DESC
    , product_id;
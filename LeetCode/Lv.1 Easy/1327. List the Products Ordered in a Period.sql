SELECT p.product_name
    , SUM(unit) AS unit
FROM products AS p
    INNER JOIN orders AS o ON p.product_id = o.product_id
WHERE DATE_FORMAT(order_date, '%Y-%m') = '2020-02'
GROUP BY p.product_name
HAVING unit >= 100;
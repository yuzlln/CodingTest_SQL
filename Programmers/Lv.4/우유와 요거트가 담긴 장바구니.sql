SELECT cart_id
FROM cart_products
GROUP BY cart_id
HAVING MAX(IF(name = 'Yogurt', 1, 0)) = 1
    AND MAX(IF(name = 'Milk', 1, 0)) = 1
ORDER BY cart_id;
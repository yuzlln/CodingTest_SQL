SELECT customer_id
FROM customer
WHERE product_key IN (SELECT *
                      FROM product
                      )
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) IN (SELECT COUNT(*)
                                       FROM product
                                       );
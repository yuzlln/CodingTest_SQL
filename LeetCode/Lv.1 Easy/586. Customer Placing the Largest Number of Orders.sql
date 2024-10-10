SELECT customer_number
FROM (SELECT customer_number
            , DENSE_RANK() OVER(ORDER BY COUNT(order_number) DESC) AS num
        FROM orders
        GROUP BY customer_number
        ) AS sub
WHERE num = 1;
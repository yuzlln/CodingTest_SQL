SELECT c.country
  , c.customer_id
  , o.order_date
  , o.order_id
FROM orders AS o
  LEFT JOIN customers AS c ON o.customer_id = c.customer_id
WHERE c.country = 'Singapore'
ORDER BY o.order_date DESC;
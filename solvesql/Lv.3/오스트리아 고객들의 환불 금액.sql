SELECT SUM(price * -quantity) AS refund_austria
FROM order_items AS i
  INNER JOIN orders AS o ON i.order_id = o.order_id
  INNER JOIN customers AS c ON o.customer_id = c.customer_id
WHERE c.country = 'Austria'
  AND LEFT(i.order_id, 1) = 'C';
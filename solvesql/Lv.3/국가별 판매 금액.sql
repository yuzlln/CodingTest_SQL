SELECT c.country
  , SUM(i.price * i.quantity) AS sales
FROM orders AS o 
  LEFT JOIN customers AS c ON o.customer_id = c.customer_id
  LEFT JOIN order_items AS i ON o.order_id = i.order_id
WHERE DATE_FORMAT(o.order_date, '%Y-%m') = '2019-01'
  AND LEFT(i.order_id, 1) != 'C' -- 환불한 금액은 매출에서 제외
GROUP BY c.country
ORDER BY sales DESC;
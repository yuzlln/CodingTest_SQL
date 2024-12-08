WITH ok AS ( -- 주문 취소x
  SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS order_month
    , SUM(i.price * i.quantity) AS ordered_amount
  FROM orders AS o 
    INNER JOIN order_items AS i ON o.order_id = i.order_id
  WHERE LEFT(i.order_id, 1) != 'C'
  GROUP BY order_month
)
, fail AS ( -- 주문 취소o
  SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS order_month
    , SUM(i.price * i.quantity) AS canceled_amount
  FROM orders AS o 
    INNER JOIN order_items AS i ON o.order_id = i.order_id
  WHERE LEFT(i.order_id, 1) = 'C'
  GROUP BY order_month
)

SELECT o.*
  , f.canceled_amount
  , (o.ordered_amount + f.canceled_amount) AS total_amount
FROM ok AS o 
  INNER JOIN fail AS f ON o.order_month = f.order_month
ORDER BY o.order_month;
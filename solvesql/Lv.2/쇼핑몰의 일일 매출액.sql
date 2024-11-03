SELECT DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m-%d') AS dt
  , ROUND(SUM(p.payment_value), 2) AS revenue_daily
FROM olist_orders_dataset AS o 
  INNER JOIN olist_order_payments_dataset AS p ON o.order_id = p.order_id
WHERE DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m-%d') >= '2018-01-01'
GROUP BY dt 
ORDER BY dt;
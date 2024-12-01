-- 방법 1) IF 함수
SELECT DATE(order_delivered_carrier_date) AS delivered_carrier_date
  , COUNT(IF(order_delivered_carrier_date IS NOT NULL AND order_delivered_customer_date IS NULL, order_id, NULL)) AS orders
FROM olist_orders_dataset
WHERE DATE_FORMAT(order_delivered_carrier_date, '%Y-%m') = '2017-01'
GROUP BY delivered_carrier_date
HAVING orders != 0
ORDER BY delivered_carrier_date;



-- 방법 2) WHERE 조건절
SELECT DATE(order_delivered_carrier_date) AS delivered_carrier_date
  , COUNT(*) AS orders
FROM olist_orders_dataset
WHERE DATE_FORMAT(order_delivered_carrier_date, '%Y-%m') = '2017-01'
  AND order_delivered_carrier_date IS NOT NULL
  AND order_delivered_customer_date IS NULL
GROUP BY delivered_carrier_date
ORDER BY delivered_carrier_date;
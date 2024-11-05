WITH customers AS (
  SELECT r.customer_id
    , DATE_FORMAT(r.order_date, '%Y-%m-01') AS order_month
    , DATE_FORMAT(c.first_order_date, '%Y-%m-01') AS first_order_month
  FROM records AS r
    INNER JOIN customer_stats AS c ON r.customer_id = c.customer_id
)

SELECT first_order_month
  , COUNT(DISTINCT IF(order_month = first_order_month, customer_id, NULL)) AS month0
  , COUNT(DISTINCT IF(order_month = DATE_ADD(first_order_month, INTERVAL 1 MONTH), customer_id, NULL)) AS month1
  , COUNT(DISTINCT IF(order_month = DATE_ADD(first_order_month, INTERVAL 2 MONTH), customer_id, NULL)) AS month2
  , COUNT(DISTINCT IF(order_month = DATE_ADD(first_order_month, INTERVAL 3 MONTH), customer_id, NULL)) AS month3
  , COUNT(DISTINCT IF(order_month = DATE_ADD(first_order_month, INTERVAL 4 MONTH), customer_id, NULL)) AS month4
  , COUNT(DISTINCT IF(order_month = DATE_ADD(first_order_month, INTERVAL 5 MONTH), customer_id, NULL)) AS month5
  , COUNT(DISTINCT IF(order_month = DATE_ADD(first_order_month, INTERVAL 6 MONTH), customer_id, NULL)) AS month6
  , COUNT(DISTINCT IF(order_month = DATE_ADD(first_order_month, INTERVAL 7 MONTH), customer_id, NULL)) AS month7
  , COUNT(DISTINCT IF(order_month = DATE_ADD(first_order_month, INTERVAL 8 MONTH), customer_id, NULL)) AS month8
  , COUNT(DISTINCT IF(order_month = DATE_ADD(first_order_month, INTERVAL 9 MONTH), customer_id, NULL)) AS month9
  , COUNT(DISTINCT IF(order_month = DATE_ADD(first_order_month, INTERVAL 10 MONTH), customer_id, NULL)) AS month10
  , COUNT(DISTINCT IF(order_month = DATE_ADD(first_order_month, INTERVAL 11 MONTH), customer_id, NULL)) AS month11
FROM customers
GROUP BY first_order_month
ORDER BY first_order_month;
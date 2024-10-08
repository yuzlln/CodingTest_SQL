SELECT DATE_FORMAT(order_purchase_timestamp, '%Y-%m-%d') AS purchase_date 
  , COUNT(DISTINCT IF(order_estimated_delivery_date >= order_delivered_customer_date, order_id, NULL)) AS success
  , COUNT(DISTINCT IF(order_estimated_delivery_date < order_delivered_customer_date, order_id, NULL)) AS fail
FROM olist_orders_dataset
WHERE DATE_FORMAT(order_purchase_timestamp, '%Y-%m')  = '2017-01'
  AND (order_delivered_carrier_date IS NOT NULL
    OR order_estimated_delivery_date IS NOT NULL)
GROUP BY purchase_date
ORDER BY purchase_date;
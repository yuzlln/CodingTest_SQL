-- ARPPU(Average Revenue Per Paying User) : 결제 고객 1인당 평균 결제 금액(전체 매출액 / 고객 수)
SELECT DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m-%d') AS dt
	-- 고객 수 (구매 상품이 달라도 order_id가 같으면 고객 한명)
  , COUNT(DISTINCT o.customer_id) AS pu
  , ROUND(SUM(p.payment_value), 2) AS revenue_daily
  , ROUND(SUM(p.payment_value) / COUNT(DISTINCT o.customer_id), 2) AS arppu
FROM olist_orders_dataset AS o 
  INNER JOIN olist_order_payments_dataset AS p ON o.order_id = p.order_id
WHERE DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m-%d') >= '2018-01-01'
GROUP BY dt
ORDER BY dt;
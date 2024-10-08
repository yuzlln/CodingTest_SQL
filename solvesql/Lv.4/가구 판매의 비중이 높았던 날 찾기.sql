SELECT order_date
  -- 일별 Furniture 카테고리 '주문 수' (한번의 주문에 Furniture가 2개이면 1개로 count)
  , COUNT(DISTINCT IF(category = 'Furniture', order_id, NULL)) AS furniture
  -- 일별 전체 주문 대비 Furniture 카테고리 주문의 비율 (%)
  , ROUND(100 * COUNT(DISTINCT IF(category = 'Furniture', order_id, NULL)) / COUNT(DISTINCT order_id), 2) AS furniture_pct
FROM records
GROUP BY order_date
HAVING COUNT(DISTINCT order_id) >= 10 -- 일별 주문 수가 10개 이상인 날 중
  AND furniture_pct >= 40 -- Furniture 카테고리 주문의 비율이 40% 이상이었던 날
ORDER BY furniture_pct DESC
  , order_date;
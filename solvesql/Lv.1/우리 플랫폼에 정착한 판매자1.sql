-- 총 주문이 100건 이상 들어온 판매자 리스트
SELECT seller_id
  , COUNT(DISTINCT order_id) AS orders
FROM olist_order_items_dataset
GROUP BY seller_id
HAVING orders >= 100;
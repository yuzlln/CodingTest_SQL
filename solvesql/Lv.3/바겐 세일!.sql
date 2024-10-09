SELECT order_date
  , SUM(IF(discount >= 0.8, quantity, 0)) AS big_discount_items
  , SUM(quantity) AS all_items
FROM records
GROUP BY order_date
HAVING SUM(quantity) >= 10 -- 전체 상품 판매 개수가 10개 이상
  AND big_discount_items >= 1 -- 80%이상 할인 판매한 상품이 적어도 1개인 날
ORDER BY big_discount_items DESC; 
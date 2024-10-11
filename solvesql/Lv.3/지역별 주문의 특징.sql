SELECT region AS Region
  -- 해당 지역내 Furniture 주문 수 (IF구문에 NULL값을 넣으면 COUNT되지 않음)
  , COUNT(DISTINCT IF(category = 'Furniture', order_id, NULL)) AS Furniture
  -- 열 이름에 띄어쓰기 있으면 `` (물결키와 동일)
  , COUNT(DISTINCT IF(category = 'Office Supplies', order_id, NULL)) AS `Office Supplies`
  , COUNT(DISTINCT IF(category = 'Technology', order_id, NULL)) AS Technology
FROM records
GROUP BY region
ORDER BY region;
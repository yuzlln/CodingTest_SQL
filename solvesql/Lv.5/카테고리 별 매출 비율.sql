SELECT category
  , sub_category
  -- 서브 카테고리별 매출액 합계
  , ROUND(SUM(SUM(sales)) OVER(PARTITION BY sub_category), 2) AS sales_sub_category
  -- 카테고리별 매출액 합계
  , ROUND(SUM(SUM(sales)) OVER(PARTITION BY category), 2) AS sales_category
  -- 전체 매출액
  , ROUND(SUM(SUM(sales)) OVER(), 2) AS sales_total
  -- 카테고리 매출 중 해당 서브 카테고리 매출의 비율 (%)
  , ROUND(100 * SUM(SUM(sales)) OVER(PARTITION BY sub_category) / SUM(SUM(sales)) OVER(PARTITION BY category), 2) AS pct_in_category
  -- 전체 매출 중 해당 서브 카테고리 매출의 비율 (%)
  , ROUND(100 * SUM(SUM(sales)) OVER(PARTITION BY sub_category) / SUM(SUM(sales)) OVER(), 2) AS pct_in_total
FROM records
GROUP BY category
  , sub_category;

WITH rfm AS (
  SELECT IF(last_order_date >= '2020-12-01', 'recent', 'past') AS recency
    , IF(cnt_orders >= 3, 'high', 'low') AS frequency
    , IF(sum_sales >= 500, 'high', 'low') AS monetary
    , COUNT(*) AS customers
  FROM customer_stats
  GROUP BY recency
    , frequency
    , monetary
)

SELECT *
FROM rfm
WHERE frequency = 'high'
  AND monetary = 'high'
ORDER BY recency DESC;
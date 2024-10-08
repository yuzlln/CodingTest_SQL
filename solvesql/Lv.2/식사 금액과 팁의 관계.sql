SELECT day
  , SUM(tip) AS tip_daily
  , SUM(total_bill) AS revenue_daily
  , ROUND(100 * SUM(tip) / SUM(total_bill), 2) AS tip_revenue_pct
FROM tips
GROUP BY day
ORDER BY tip_revenue_pct DESC;
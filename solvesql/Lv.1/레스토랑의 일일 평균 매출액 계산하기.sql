SELECT ROUND(AVG(sales), 2) AS avg_sales
FROM (SELECT day
        , SUM(total_bill) AS sales
      FROM tips
      GROUP BY day
      ) AS sub;
WITH top AS (
  SELECT *
    , DENSE_RANK() OVER(PARTITION BY day ORDER BY total_bill DESC) AS num
  FROM tips
)

SELECT day
  , time
  , sex
  , total_bill
FROM top
WHERE num <= 3;

WITH customer_7day AS (
    SELECT visited_on
        , CASE WHEN COUNT(*) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) >= 7 
                THEN SUM(SUM(amount)) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
                END AS amount
    FROM customer
    GROUP BY visited_on
)

SELECT *
    , ROUND(amount / 7, 2) AS average_amount
FROM customer_7day
WHERE amount IS NOT NULL
ORDER BY visited_on;
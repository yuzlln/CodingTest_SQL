WITH weight_sum AS (
    SELECT *
        , SUM(weight) OVER(ORDER BY turn) AS total_weight
    FROM queue
)

SELECT person_name
FROM weight_sum
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;
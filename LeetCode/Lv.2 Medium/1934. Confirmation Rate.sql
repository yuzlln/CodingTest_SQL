WITH rate AS (
    SELECT user_id
        , ROUND(SUM(IF(action = 'confirmed', 1, 0)) / COUNT(*), 2) AS confirmation_rate
    FROM confirmations
    GROUP BY user_id
)

SELECT s.user_id
    , COALESCE(r.confirmation_rate, 0) AS confirmation_rate
FROM signups AS s
    LEFT JOIN rate AS r ON s.user_id = r.user_id;
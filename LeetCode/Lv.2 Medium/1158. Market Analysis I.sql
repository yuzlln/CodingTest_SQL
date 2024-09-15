WITH buyer_2019 AS (
    SELECT buyer_id
        , COUNT(*) AS cnt
    FROM orders
    WHERE YEAR(order_date) = '2019'
    GROUP BY buyer_id
)

SELECT u.user_id AS buyer_id
    , u.join_date
    , IF(b.cnt IS NULL, 0, b.cnt) AS orders_in_2019
FROM users AS u
    LEFT JOIN buyer_2019 AS b ON u.user_id = b.buyer_id;
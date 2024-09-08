SELECT YEAR(s.sales_date) AS year
    , MONTH(s.sales_date) AS month
    , u.gender
    , COUNT(DISTINCT s.user_id) AS users
FROM online_sale AS s
    LEFT JOIN user_info AS u ON s.user_id = u.user_id
WHERE u.gender IS NOT NULL
GROUP BY year
    , month
    , u.gender
ORDER BY year
    , month
    , u.gender;
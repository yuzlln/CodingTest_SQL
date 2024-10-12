SELECT COUNT(*) AS fish_count
    , MONTH(time) AS month
FROM fish_info
GROUP BY month
HAVING fish_count > 0
ORDER BY month;
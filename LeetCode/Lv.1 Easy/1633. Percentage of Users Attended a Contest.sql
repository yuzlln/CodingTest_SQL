WITH count AS (
    SELECT COUNT(DISTINCT user_id) AS cnt
    FROM users
)

SELECT r.contest_id
    , ROUND(100 * COUNT(DISTINCT r.user_id) / (SELECT *
                                               FROM count
                                               ), 2) AS percentage
FROM users AS u
    INNER JOIN register AS r ON u.user_id = r.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC
    , r.contest_id;
-- 방법 1) DATE_ADD 함수
WITH log AS (
    SELECT player_id
        , IF(DATE_ADD(MIN(event_date) OVER(PARTITION BY player_id), INTERVAL 1 DAY) = event_date, 1, 0) AS log_flag
    FROM activity
)

SELECT ROUND(SUM(log_flag) / COUNT(DISTINCT player_id), 2) AS fraction
FROM log;



-- 방법 2) DATEDIFF 함수
WITH log AS (
    SELECT player_id
        , IF(DATEDIFF(event_date, MIN(event_date) OVER(PARTITION BY player_id)) = 1, 1, 0) AS log_flag
    FROM activity
)

SELECT ROUND(SUM(log_flag) / COUNT(DISTINCT player_id), 2) AS fraction
FROM log;



-- 방법 3)
WITH first_log AS (
    SELECT player_id
        , MIN(event_date) AS event_date
    FROM activity
    GROUP BY player_id
)

SELECT ROUND(COUNT(DISTINCT a.player_id) / COUNT(DISTINCT f.player_id), 2) AS fraction
FROM first_log AS f
    LEFT JOIN activity AS a ON f.player_id = a.player_id
        AND DATE_ADD(f.event_date, INTERVAL 1 DAY) = a.event_date;
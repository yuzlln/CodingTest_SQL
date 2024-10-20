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
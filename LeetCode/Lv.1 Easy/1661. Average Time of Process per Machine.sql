-- 방법1)
WITH start_end AS ( -- machine_id, process_id별 start, end timestamp
    SELECT a1.machine_id
        , a1.process_id
        , a1.timestamp AS start
        , a2.timestamp AS end
    FROM activity AS a1
        INNER JOIN activity AS a2 ON a1.machine_id = a2.machine_id
            AND a1.process_id = a2.process_id
    WHERE a1.activity_type = 'start'
        AND a2.activity_type = 'end'
)

SELECT machine_id
    , ROUND(SUM(end - start) / COUNT(*), 3) AS processing_time
FROM start_end
GROUP BY machine_id;



-- 방법2)
WITH results AS (
    SELECT machine_id
        , process_id
        , MAX(IF(activity_type = 'start', timestamp, 0)) AS start
        , MAX(IF(activity_type = 'end', timestamp, 0)) AS end
    FROM activity
    GROUP BY machine_id
        , process_id
)

SELECT machine_id
    , ROUND(SUM(end - start) / COUNT(*), 3) AS processing_time
FROM results
GROUP BY machine_id;
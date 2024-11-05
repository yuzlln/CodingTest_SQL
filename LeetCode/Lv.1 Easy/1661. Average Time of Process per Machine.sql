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
WITH request AS ( -- 요청
    SELECT requester_id AS id
        , COUNT(*) AS cnt
    FROM requestaccepted
    GROUP BY requester_id
)
, accept AS ( -- 수락
    SELECT accepter_id AS id
        , COUNT(*) AS cnt
    FROM requestaccepted
    GROUP BY accepter_id
)
, friends AS ( -- 요청 + 수락 친구 수
    SELECT id
        , SUM(cnt) AS num
    FROM (SELECT *
          FROM request

          UNION ALL 

          SELECT *
          FROM accept
          ) AS sub
    GROUP BY id
)

SELECT *
FROM friends
WHERE num IN (SELECT MAX(num)
              FROM friends    
              );
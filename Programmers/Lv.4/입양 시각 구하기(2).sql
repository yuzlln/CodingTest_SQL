SET @hour := -1; -- 계층형 쿼리

SELECT (@hour := @hour + 1) AS hour
    , (SELECT COUNT(*)
       FROM animal_outs
       WHERE HOUR(datetime) = @hour
      ) AS count
FROM animal_outs
WHERE @hour <= 22
ORDER BY @hour;
WITH weekday_measurements AS (
  SELECT *
    , CASE WHEN day_name = 0 THEN '월요일'
          WHEN day_name = 1 THEN '화요일'
          WHEN day_name = 2 THEN '수요일'
          WHEN day_name = 3 THEN '목요일'
          WHEN day_name = 4 THEN '금요일'
          WHEN day_name = 5 THEN '토요일'
          ELSE '일요일' END AS weekday
  FROM (SELECT *
          , WEEKDAY(measured_at) AS day_name
        FROM measurements
        ) AS sub
)

SELECT weekday
  , ROUND(AVG(no2), 4) AS no2
  , ROUND(AVG(o3), 4) AS o3
  , ROUND(AVG(co), 4) AS co
  , ROUND(AVG(so2), 4) AS so2
  , ROUND(AVG(pm10), 4) AS pm10
  , ROUND(AVG(pm2_5), 4) AS pm2_5
FROM weekday_measurements
GROUP BY day_name
ORDER BY day_name;
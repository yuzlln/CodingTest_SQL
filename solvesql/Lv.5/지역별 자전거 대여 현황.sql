SELECT s1.local
  , COUNT(bike_id) AS all_rent
  , COUNT(IF(s1.local = s2.local, bike_id, NULL)) AS same_local
  , COUNT(IF(s1.local != s2.local, bike_id, NULL)) AS diff_local
FROM rental_history AS h 
  INNER JOIN station AS s1 ON h.rent_station_id = s1.station_id -- 대여 지자체
  INNER JOIN station AS s2 ON h.return_station_id = s2.station_id -- 반납 지자체
WHERE DATE_FORMAT(h.rent_at, '%Y-%m') = '2021-01'
   AND DATE_FORMAT(h.return_at, '%Y-%m') = '2021-01' -- 반납 & 대여 모두 2021년 1월
GROUP BY s1.local
ORDER BY all_rent DESC;
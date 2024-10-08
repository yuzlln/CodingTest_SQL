SELECT quartet
  , x
  , COUNT(*) AS cnt
FROM points
GROUP BY quartet
  , x
HAVING cnt >= 2;
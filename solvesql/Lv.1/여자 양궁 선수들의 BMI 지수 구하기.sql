SELECT athlete_id
  , medal
  , sex
  , weight
  , height
  , ROUND(weight / POWER(0.01 * height, 2), 2) AS bmi
FROM records
WHERE game_id = 49
  AND event_id = 39
  AND weight IS NOT NULL
  AND height IS NOT NULL;
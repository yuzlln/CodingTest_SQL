SELECT name
    , COUNT(*) AS cnt
FROM animal_ins
WHERE name IS NOT NULL
GROUP BY name
HAVING cnt >= 2
ORDER BY name;
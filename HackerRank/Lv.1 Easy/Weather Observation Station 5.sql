SELECT city
    , LENGTH(city) AS len
FROM station
ORDER BY len
    , city
LIMIT 1;

SELECT city
    , LENGTH(city) AS len
FROM station
ORDER BY len DESC
    , city
LIMIT 1;
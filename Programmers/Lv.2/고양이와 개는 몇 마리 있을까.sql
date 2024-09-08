-- 방법 1) HAVING절
SELECT animal_type
    , COUNT(*) AS count
FROM animal_ins
GROUP BY animal_type
HAVING animal_type IN ('Dog', 'Cat')
ORDER BY animal_type;



-- 방법 2) WHERE절
SELECT animal_type
    , COUNT(*) AS count
FROM animal_ins
WHERE animal_type IN ('Dog', 'Cat')
GROUP BY animal_type
ORDER BY animal_type;

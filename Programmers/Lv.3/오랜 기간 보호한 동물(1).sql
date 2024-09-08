SELECT i.name
    , i.datetime
FROM animal_ins AS i
    LEFT JOIN animal_outs AS o ON i.animal_id = o.animal_id
WHERE o.animal_id IS NULL
ORDER BY i.datetime
LIMIT 3;
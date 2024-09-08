SELECT w.id
    , p.age
    , w.coins_needed
    , w.power
FROM wands AS w
    INNER JOIN wands_property AS p ON w.code = p.code
WHERE p.is_evil = 0
    AND (w.power, p.age, w.coins_needed) IN (SELECT w2.power
                                                 , p2.age
                                                 , MIN(w2.coins_needed)
                                             FROM wands AS w2
                                                 INNER JOIN wands_property AS p2 ON w2.code = p2.code
                                             GROUP BY w2.power
                                                 , p2.age
                                             )
ORDER BY w.power DESC
    , p.age DESC;

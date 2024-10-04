-- 방법 1) JOIN
SELECT o.animal_id
    , o.name
FROM animal_outs AS o
    LEFT JOIN animal_ins AS i ON o.animal_id = i.animal_id
WHERE i.animal_id IS NULL
ORDER BY o.animal_id
    , o.name;
    
    
    
-- 방법 2) 서브 쿼리
SELECT animal_id
    , name
FROM animal_outs
WHERE animal_id NOT IN (SELECT animal_id
                        FROM animal_ins
                        )
ORDER BY animal_id;  
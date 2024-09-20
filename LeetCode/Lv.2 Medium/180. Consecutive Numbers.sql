SELECT DISTINCT g1.num AS ConsecutiveNums
FROM logs AS g1
    INNER JOIN logs AS g2 ON g1.id + 1 = g2.id 
        AND g1.num = g2.num
    INNER JOIN logs AS g3 ON g1.id + 2 = g3.id
        AND g1.num = g3.num;
-- 방법 1) ORDER BY절
SELECT h.flavor
FROM first_half AS h
    INNER JOIN july AS j ON h.flavor = j.flavor
GROUP BY h.flavor
ORDER BY h.total_order + SUM(j.total_order) DESC -- july order만 sum
LIMIT 3;



-- 방법 2) Window Function
SELECT flavor
FROM (SELECT h.flavor
          , ROW_NUMBER() OVER(ORDER BY h.total_order + SUM(j.total_order) DESC) AS num
      FROM first_half AS h
          INNER JOIN july AS j ON h.flavor = j.flavor
      GROUP BY h.flavor
      ORDER BY num
     ) AS t
WHERE num <= 3;
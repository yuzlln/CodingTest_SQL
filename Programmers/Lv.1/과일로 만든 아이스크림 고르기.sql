SELECT f.flavor
FROM first_half AS f
    INNER JOIN icecream_info AS i ON f.flavor = i.flavor
WHERE i.ingredient_type = 'fruit_based'
GROUP BY f.flavor
HAVING SUM(f.total_order) >= 3000
ORDER BY f.total_order DESC;
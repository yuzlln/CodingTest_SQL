SELECT i.ingredient_type
    , SUM(h.total_order) AS total_order
FROM first_half AS h
    INNER JOIN icecream_info AS i ON h.flavor = i.flavor
GROUP BY i.ingredient_type
ORDER BY total_order;
SELECT COUNT(*) AS fish_count
    , n.fish_name
FROM fish_info AS i
    INNER JOIN fish_name_info AS n ON i.fish_type = n.fish_type
GROUP BY n.fish_name
ORDER BY fish_count DESC;
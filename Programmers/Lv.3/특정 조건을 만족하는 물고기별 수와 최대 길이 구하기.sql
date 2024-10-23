WITH big AS ( -- 평균 길이가 33cm 이상인 fish_type
    SELECT fish_type
    FROM fish_info
    GROUP BY fish_type
    HAVING AVG(COALESCE(length, 10)) >= 33
)

SELECT COUNT(*) AS fish_count
    , MAX(COALESCE(length, 10)) AS max_length
    , fish_type
FROM fish_info
WHERE fish_type IN (SELECT *
                    FROM big
                   )
GROUP BY fish_type
ORDER BY fish_type;
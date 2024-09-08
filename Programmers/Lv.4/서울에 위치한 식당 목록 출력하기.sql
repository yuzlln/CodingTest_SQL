SELECT DISTINCT i.rest_id
    , i.rest_name
    , i.food_type
    , i.favorites
    , i.address
    , ROUND(AVG(r.review_score) OVER(PARTITION BY i.rest_id), 2) AS score
FROM rest_review AS r
    LEFT JOIN rest_info AS i ON r.rest_id = i.rest_id
WHERE i.address LIKE '서울%'
ORDER BY score DESC
    , i.favorites DESC;
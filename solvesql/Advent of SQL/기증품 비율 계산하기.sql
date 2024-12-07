WITH gift AS (
  SELECT COUNT(*)
  FROM artworks
  WHERE LOWER(credit) LIKE '%gift%'
)

SELECT ROUND((SELECT *
              FROM gift
              ) / COUNT(*) * 100, 3) AS ratio
FROM artworks;
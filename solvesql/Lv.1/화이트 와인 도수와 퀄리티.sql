SELECT color
  , pH
  , alcohol
  , quality
FROM wines
WHERE quality >= 8
  AND alcohol <= 12
  AND color = 'white';
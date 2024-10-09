-- 방법 1) 와일드카드
SELECT object_number
  , title
  , medium
  , acquisition_date
  , department
FROM artworks
WHERE medium LIKE '%pastel%'
  OR medium LIKE '%Pastel%'
  OR medium LIKE '%crayon%'
  OR medium LIKE '%Crayon%'
ORDER BY acquisition_date DESC;



-- 방법 2) 정규 표현식
SELECT object_number
  , title
  , medium
  , acquisition_date
  , department
FROM artworks
WHERE medium REGEXP 'pastel|Pastel|crayon|Crayon'
ORDER BY acquisition_date DESC;
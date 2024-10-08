WITH prefer AS ( -- 플랫폼 사용 빈도 순으로 나열한 테이블
  SELECT *
    , CONCAT(netflix, prime_video, disney_plus, hulu) AS plat
  FROM movies
  WHERE year = 2021
)

SELECT title
  , year
  , genres
  , directors
  , CASE WHEN plat LIKE '1___' THEN 'netflix'
         WHEN plat LIKE '_1__' THEN 'prime_video'
         WHEN plat LIKE '__1_' THEN 'disney_plus'
         ELSE 'hulu' END AS platform
FROM prefer
ORDER BY title;
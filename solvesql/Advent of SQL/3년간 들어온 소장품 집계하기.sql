WITH artworks_table AS (
  SELECT YEAR(acquisition_date) AS year 
    , classification
  FROM artworks
)

SELECT classification
  , SUM(IF(year = '2014', 1, 0)) AS '2014'
  , SUM(IF(year = '2015', 1, 0)) AS '2015'
  , SUM(IF(year = '2016', 1, 0)) AS '2016'
FROM artworks_table
GROUP BY classification
ORDER BY classification;
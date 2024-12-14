WITH max_x AS (
  SELECT MAX(x)
  FROM points
)
, max_y AS (
  SELECT MAX(y)
  FROM points
)

SELECT id
FROM points
WHERE x IN (SELECT *
            FROM max_x
            )
  OR y IN (SELECT *
           FROM max_y
           )
ORDER BY id;
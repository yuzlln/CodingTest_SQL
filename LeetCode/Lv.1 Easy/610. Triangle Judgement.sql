SELECT *
    , IF(2 * GREATEST(x, y, z) < x + y + z, 'Yes', 'No') AS triangle
FROM triangle;
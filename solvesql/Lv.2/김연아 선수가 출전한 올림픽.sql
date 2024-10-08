SELECT g.year
  , g.season
  , g.city
FROM games AS g 
  INNER JOIN records AS r ON g.id = r.game_id
  INNER JOIN athletes AS a ON r.athlete_id = a.id
WHERE a.name = 'Yu-Na Kim'
ORDER BY g.year DESC;
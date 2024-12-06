SELECT c.name
FROM games AS g 
  INNER JOIN companies AS c ON g.publisher_id = c.company_id
GROUP BY c.name
HAVING COUNT(DISTINCT g.game_id) >= 10;
SELECT DISTINCT r.athlete_id
FROM events AS e 
  INNER JOIN records AS r ON e.id = r.event_id
WHERE e.sport = 'Golf';
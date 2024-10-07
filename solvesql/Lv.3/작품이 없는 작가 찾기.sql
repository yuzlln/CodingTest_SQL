SELECT a.artist_id
  , a.name
FROM artists AS a 
  LEFT JOIN artworks_artists AS w ON a.artist_id = w.artist_id
WHERE a.death_year IS NOT NULL 
  AND w.artist_id IS NULL;

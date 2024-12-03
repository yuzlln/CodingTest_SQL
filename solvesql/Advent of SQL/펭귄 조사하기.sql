SELECT species
  , island
FROM penguins
GROUP BY species
  , island
ORDER BY island
  , species;
SELECT SUM(ci.population) AS pop
FROM city AS ci
    INNER JOIN country AS co ON ci.countrycode = co.code
WHERE co.continent = 'Asia';
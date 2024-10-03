SELECT o.continent
    , FLOOR(AVG(i.population)) AS pop
FROM city AS i
    INNER JOIN country AS o ON i.countrycode = o.code
GROUP BY o.continent;
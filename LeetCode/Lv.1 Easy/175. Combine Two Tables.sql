SELECT p.firstname AS firstName
    , p.lastname AS lastName
    , IF(a.personid IS NOT NULL, city, NULL) AS city
    , IF(a.personid IS NOT NULL, state, NULL) AS state
FROM person AS p
    LEFT JOIN address AS a ON p.personid = a.personid;
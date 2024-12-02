WITH not_red AS (
    SELECT DISTINCT sales_id
    FROM orders AS o
        INNER JOIN company AS c ON o.com_id = c.com_id
    WHERE c.name = 'RED'
)

SELECT name
FROM salesperson
WHERE sales_id NOT IN (SELECT *
					   FROM not_red
                       )
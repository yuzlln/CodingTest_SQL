WITH cat AS (
    SELECT 'Low Salary' AS category
    UNION ALL SELECT 'Average Salary' AS category
    UNION ALL SELECT 'High Salary' AS category
)
, cat_accounts AS (
SELECT *
    , CASE WHEN income < 20000 THEN 'Low Salary'
           WHEN income <= 50000 THEN 'Average Salary'
           ELSE 'High Salary' END AS category
FROM accounts
)

SELECT c.category
    , SUM(IF(c.category = ca.category, 1, 0)) AS accounts_count
FROM cat AS c
    CROSS JOIN cat_accounts AS ca
GROUP BY c.category;
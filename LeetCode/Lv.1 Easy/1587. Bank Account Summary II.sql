SELECT u.name
    , SUM(t.amount) AS balance
FROM users AS u
    INNER JOIN transactions AS t ON u.account = t.account
GROUP BY u.name
HAVING balance > 10000;
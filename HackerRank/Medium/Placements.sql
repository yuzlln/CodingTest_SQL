SELECT s.name
FROM students AS s
    LEFT JOIN friends AS f ON s.id = f.id
    LEFT JOIN packages AS p ON s.id = p.id
    LEFT JOIN packages AS pf ON f.friend_id = pf.id
WHERE p.salary < pf.salary
ORDER BY pf.salary;
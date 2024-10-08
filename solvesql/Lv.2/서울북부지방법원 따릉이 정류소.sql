SELECT *
FROM station
WHERE lat > (SELECT lat
             FROM station
             WHERE name = '서울북부지방법원'
             );
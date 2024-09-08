SELECT b.author_id
    , MAX(a.author_name) AS author_name
    , b.category
    , SUM(s.sales * b.price) AS total_sales
FROM book_sales AS s
    LEFT JOIN book AS b ON s.book_id = b.book_id
    LEFT JOIN author AS a ON b.author_id = a.author_id
WHERE DATE_FORMAT(s.sales_date, '%Y-%m') = '2022-01'
GROUP BY b.author_id
    , b.category
ORDER BY b.author_id
    , b.category DESC;
SELECT b.category
    , SUM(s.sales) AS total_sales
FROM book_sales AS s
    LEFT JOIN book AS b ON s.book_id = b.book_id
WHERE DATE_FORMAT(s.sales_date, '%Y-%m') = '2022-01'
GROUP BY b.category
ORDER BY b.category;
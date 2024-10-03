SELECT b.book_id
    , a.author_name
    , DATE_FORMAT(b.published_date, '%Y-%m-%d') AS published_date
FROM book AS b
    INNER JOIN author AS a ON b.author_id = a.author_id
WHERE b.category = '경제'
ORDER BY published_date;
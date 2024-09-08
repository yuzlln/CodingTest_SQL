SELECT u.user_id
    , u.nickname
    , SUM(b.price) AS total_sales
FROM used_goods_board AS b
    LEFT JOIN used_goods_user AS u ON b.writer_id = u.user_id
WHERE b.status = 'DONE'
GROUP BY u.user_id
HAVING SUM(b.price) >= 700000
ORDER BY total_sales;
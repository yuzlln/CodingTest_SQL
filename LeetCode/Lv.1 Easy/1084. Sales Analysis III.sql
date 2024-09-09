SELECT p.product_id
    , p.product_name
FROM product AS p
    INNER JOIN (SELECT product_id
                FROM sales
                GROUP BY product_id
                HAVING MAX(sale_date) <= '2019-03-31'
                    AND MIN(sale_date) >= '2019-01-01'
                ) AS sm ON p.product_id = sm.product_id;
SELECT p.product_id
    -- If a product does not have any sold units, its average selling price is assumed to be 0.
    , COALESCE(ROUND(SUM(p.price * u.units) / SUM(u.units), 2), 0) AS average_price
FROM prices AS p
    LEFT JOIN unitssold AS u ON p.product_id = u.product_id
        AND u.purchase_date BETWEEN p.start_date AND p.end_date -- 기한 내에 판매된 상품
GROUP BY p.product_id;

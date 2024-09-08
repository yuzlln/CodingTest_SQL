SELECT user_id
    , product_id
FROM (SELECT user_id
          , product_id
          , COUNT(*) AS cnt
      FROM online_sale
      GROUP BY user_id
          , product_id
      ) AS t
WHERE cnt >= 2
ORDER BY user_id
    , product_id DESC;

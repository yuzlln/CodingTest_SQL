WITH first_order AS (
    SELECT customer_id
        , MIN(order_date)
    FROM delivery
    GROUP BY customer_id
)
, first_order_immediate_flag AS (
    SELECT *
        , IF(order_date = customer_pref_delivery_date, 1, 0) AS immediate
    FROM delivery
    WHERE (customer_id, order_date) IN (SELECT *
                                        FROM first_order
                                        )    
)


SELECT ROUND(100 * SUM(immediate) / COUNT(*), 2) AS immediate_percentage
FROM first_order_immediate_flag;

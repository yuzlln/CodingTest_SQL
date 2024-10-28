WITH users AS ( -- 2021년에 가입한 회원
    SELECT *
    FROM user_info
    WHERE YEAR(joined) = 2021
)

SELECT YEAR(sales_date) AS year
    , MONTH(sales_date) AS month
    , COUNT(DISTINCT u.user_id) AS purchased_users -- 2021년에 가입한 전체 회원들 중 상품을 구매한 회원수
    , ROUND(COUNT(DISTINCT u.user_id) / (SELECT COUNT(DISTINCT user_id)
                                          FROM users
                                          )
            , 1) AS purchased_ratio -- 상품을 구매한 회원의 비율(=2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 회원 수)
FROM users AS u
    INNER JOIN online_sale AS s ON u.user_id = s.user_id
GROUP BY year
    , month
ORDER BY year
    , month;
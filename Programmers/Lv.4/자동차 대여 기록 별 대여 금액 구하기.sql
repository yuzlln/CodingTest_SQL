WITH truck AS ( -- car_type이 트럭인 자동차 정보
    SELECT *
    FROM car_rental_company_car
    WHERE car_type = '트럭'
)
, truck_diff AS ( -- 트럭 일일 대여 요금 및 대여 기간
    SELECT h.history_id
        , h.car_id
        , t.daily_fee
        , DATEDIFF(h.end_date, h.start_date) + 1 AS diff
    FROM car_rental_company_rental_history AS h
        INNER JOIN truck AS t ON h.car_id = t.car_id
)
, truck_diff_txt AS ( -- discount_plan 테이블과 연결할 수 있는 칼럼 생성
    SELECT *
        , CASE WHEN diff BETWEEN 7 AND 29 THEN '7일 이상'
               WHEN diff BETWEEN 30 AND 89 THEN '30일 이상'
               WHEN diff >= 90 THEN '90일 이상'
               END AS diff_txt
    FROM truck_diff
)

SELECT t.history_id
    , FLOOR(CASE WHEN d.discount_rate IS NOT NULL THEN t.daily_fee * t.diff * (1 - d.discount_rate * 0.01)
            ELSE t.daily_fee * t.diff 
            END) AS fee
FROM truck_diff_txt AS t
 LEFT JOIN (SELECT *
            FROM car_rental_company_discount_plan
            WHERE car_type = '트럭'
           ) AS d ON t.diff_txt = d.duration_type
ORDER BY fee DESC
    , history_id DESC;
WITH ing AS ( -- 2022년 10월 16일에 대여 중인 자동차
    SELECT DISTINCT car_id
    FROM car_rental_company_rental_history
    WHERE '2022-10-16' BETWEEN start_date AND end_date
)

SELECT DISTINCT car_id
    , IF(car_id IN (SELECT *
                    FROM ing
                    ), '대여중', '대여 가능') AS availability
FROM car_rental_company_rental_history
ORDER BY car_id DESC;
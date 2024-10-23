WITH sedan AS ( -- 자동차 종류가 세단인 자동차 정보
    SELECT *
    FROM car_rental_company_car
    WHERE car_type = '세단'
)

SELECT DISTINCT car_id
FROM car_rental_company_rental_history
WHERE car_id IN (SELECT car_id
                 FROM sedan
                )
    AND MONTH(start_date) = 10 -- 10월에 대여를 시작한 기록
ORDER BY car_id DESC;
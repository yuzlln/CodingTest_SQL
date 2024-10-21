WITH car AS ( -- 해당 기간동안 총 대여 횟수가 5회 이상인 car_id
    SELECT car_id
    FROM car_rental_company_rental_history
    WHERE DATE_FORMAT(start_date, '%Y-%m') BETWEEN '2022-08' AND '2022-10'
    GROUP BY car_id
    HAVING COUNT(*) >= 5
)

SELECT MONTH(start_date) AS month
    , car_id
    , COUNT(*) AS records
FROM car_rental_company_rental_history
WHERE DATE_FORMAT(start_date, '%Y-%m') BETWEEN '2022-08' AND '2022-10'
    AND car_id IN (SELECT car_id
                   FROM car
                   )
GROUP BY month
    , car_id
HAVING records != 0 -- 특정 월의 총 대여 횟수가 0인 경우에는 결과에서 제외
ORDER BY month
    , car_id DESC;
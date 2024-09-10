SELECT car_id
    , ROUND(AVG(DATEDIFF(end_date, start_date) + 1), 1) AS avgerage_duration
FROM car_rental_company_rental_history
GROUP BY car_id
HAVING avgerage_duration >= 7
ORDER BY avgerage_duration DESC
    , car_id DESC;
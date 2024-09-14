-- 방법 1)
SELECT car_type
    , COUNT(*) AS cars
FROM car_rental_company_car
WHERE options LIKE '%통풍시트%'
    OR options LIKE '%열선시트%'
    OR options LIKE '%가죽시트%'
GROUP BY car_type
ORDER BY car_type;



-- 방법 2) 정규표현식
SELECT car_type
    , COUNT(*) AS cars
FROM car_rental_company_car
WHERE options REGEXP '통풍시트|열선시트|가죽시트'
GROUP BY car_type
ORDER BY car_type;
SELECT FLOOR(SUM(total_bill)) AS sum_total_bill -- FLOOR는 자리수 지정하지 않음
  , FLOOR(AVG(total_bill)) AS avg_total_bill
FROM tips
WHERE day = 'Sun'
  AND time = 'Dinner';
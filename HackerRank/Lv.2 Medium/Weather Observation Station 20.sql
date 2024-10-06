/*
데이터 개수에 상관없이 첫 데이터 행의 index가 0일때 마지막 행 index를 가지고 중앙값 계산 가능

case 1) 데이터 개수가 짝수 일 때
마지막 @num이 3이면 @num ÷ 2 = 1.5가 되며, 이 값을 FLOOR 처리하면 1, CEIL 처리하면 2가 된다.
따라서 중앙값은 FLOOR과 CEIL 처리한 @num에 해당하는 두 값의 평균이 된다.

case 2) 데이터 개수가 홀수 일 때
마지막 @num이 4이면 @num ÷ 2 = 2가 되며, 이 값을 FLOOR 처리하면 2, CEIL 처리하면 2가 된다.
따라서 중앙값은 FLOOR과 CEIL 처리한 @num에 해당하는 두 값의 평균이 된다.

 즉, num이 0으로 시작할 때 데이터 개수와 관계없이 동일한 코드로 중앙값을 구할 수 있다.
*/

SET @num := -1;

WITH cnt AS (
    SELECT (@num := @num + 1) AS num
        , lat_n
    FROM station
    ORDER BY lat_n
)

SELECT ROUND(AVG(lat_n), 4) AS median
FROM cnt
WHERE num = FLOOR(@num / 2) -- @num은 CTE에서 계산된 총 행 수
    OR num = CEIL(@num / 2);
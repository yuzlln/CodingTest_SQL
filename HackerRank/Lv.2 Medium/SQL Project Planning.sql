WITH projectgroups AS (
    SELECT *
	-- DATE_SUB(date, INTERVAL n DAY) : date에서 n일을 빼기
	-- 연속된 날짜를 가진 행은 동일한 결과
        , DATE_SUB(start_date, INTERVAL ROW_NUMBER() OVER(ORDER BY start_date) DAY) AS project_id
    FROM projects
)

SELECT MIN(start_date) AS start_date
    , MAX(end_date) AS end_date
FROM projectgroups
GROUP BY project_id
ORDER BY DATEDIFF(MAX(end_date), MIN(start_date)) -- DATEDIFF와 같은 함수로 조합된 경우 별칭 참조가 제대로 작동하지 않을 수 있음
    , MIN(start_date);

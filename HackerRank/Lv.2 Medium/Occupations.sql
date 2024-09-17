WITH num AS ( -- occupation별 name 오름차순 numbering
    SELECT *
        , ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY name) AS num
    FROM occupations
)

SELECT MIN(IF(occupation = 'Doctor', name, NULL)) AS doctor -- 이름 1개를 출력하기 위한 MIN 함수
    , MIN(IF(occupation = 'Professor', name, NULL)) AS professor
    , MIN(IF(occupation = 'Singer', name, NULL)) AS singer
    , MIN(IF(occupation = 'Actor', name, NULL)) AS actor
FROM num
GROUP BY num; -- num을 기준으로 grouping (MAX(num)에 해당하지 않는 값은 null로 출력 가능)
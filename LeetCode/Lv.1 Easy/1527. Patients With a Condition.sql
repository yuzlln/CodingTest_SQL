SELECT *
FROM patients
WHERE conditions LIKE 'DIAB1%'     -- 첫 번째 단어가 DIAB1으로 시작
    OR conditions LIKE '% DIAB1%'; -- 두 번째 단어가 DIAB1으로 시작 (띄어쓰기 주의)
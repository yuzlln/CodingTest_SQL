SELECT mcdp_cd AS '진료과코드'
    , COUNT(*) AS '5월예약건수'
FROM appointment
WHERE DATE_FORMAT(apnt_ymd, '%Y-%m') = '2022-05'
GROUP BY mcdp_cd
ORDER BY `5월예약건수` -- 컬럼 이름이나 별칭을 참조할 때는 백틱(`) 또는 큰따옴표(")를 사용
    , `진료과코드`;
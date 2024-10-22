WITH mania AS ( -- 중고 거래 게시물을 3건 이상 등록한 사용자의 사용자 ID
    SELECT writer_id
    FROM used_goods_board 
    GROUP BY writer_id
    HAVING COUNT(DISTINCT board_id) >= 3
)

SELECT user_id
    , nickname
    , CONCAT(city, ' ', street_address1, ' ', street_address2) AS `전체주소`
    , CONCAT(LEFT(tlno, 3), '-', SUBSTRING(tlno, 4, 4), '-', RIGHT(tlno, 4)) AS `전화번호`
FROM used_goods_user
WHERE user_id IN (SELECT *
                  FROM mania
                  )
ORDER BY user_id DESC;
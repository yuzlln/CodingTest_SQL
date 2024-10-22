WITH number AS ( -- 조회수 순위
    SELECT *
        , RANK() OVER(ORDER BY views DESC) AS top
    FROM used_goods_board
)
, king AS ( -- 조회수가 가장 많은 board_id
    SELECT board_id
    FROM number
    WHERE top = 1
)

SELECT CONCAT('/home/grep/src/', board_id, '/', file_id, file_name, file_ext) AS file_path
FROM used_goods_file
WHERE board_id IN (SELECT *
                   FROM king
                   )
ORDER BY file_id DESC;
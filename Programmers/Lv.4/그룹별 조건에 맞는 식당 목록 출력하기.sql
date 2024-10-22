WITH review AS ( -- 회원별 리뷰 작성 개수
    SELECT member_id
        , COUNT(DISTINCT review_id) AS cnt
    FROM rest_review
    GROUP BY member_id
)
, number AS ( -- 회원별 리뷰 작성 개수 순위
    SELECT *
        , RANK() OVER(ORDER BY cnt DESC) as top
    FROM review
)
, king AS ( -- 리뷰를 가장 많이 작성한 member_id
    SELECT member_id
    FROM number
    WHERE top = 1
)

SELECT m.member_name
    , r.review_text
    , DATE_FORMAT(r.review_date, '%Y-%m-%d') AS review_date
FROM member_profile AS m
    INNER JOIN rest_review AS r ON m.member_id = r.member_id
WHERE m.member_id IN (SELECT *
                      FROM king
                      )
ORDER BY r.review_date
    , r.review_text;
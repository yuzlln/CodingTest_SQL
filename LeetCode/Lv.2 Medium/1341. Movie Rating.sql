-- 방법1) CTE
WITH user_rating AS ( -- user별 평점을 남긴 영화수
    SELECT user_id
        , COUNT(*) AS cnt
    FROM movierating
    GROUP BY user_id
)
, max_rating AS ( -- 가장 많은 평점을 남긴 횟수
    SELECT MAX(cnt) AS max_cnt
    FROM user_rating
)
, greatest_rating_user_name AS ( -- 가장 많은 평점을 남긴 유저 이름
    SELECT name AS results
    FROM users
    WHERE user_id IN (SELECT user_id
                      FROM user_rating
                      WHERE cnt = (SELECT *
                                   FROM max_rating
                                   )
                    )
    ORDER BY results
    LIMIT 1
)
, avg_rating AS ( -- 2020년 2월에 평점을 남긴 영화별 평균 평점
    SELECT movie_id
        , AVG(rating) AS avg_movierating
    FROM movierating
    WHERE DATE_FORMAT(created_at, '%Y-%m') = '2020-02'
    GROUP BY movie_id
)
, greatest_rating_movie_name AS ( -- 가장 높은 평균 평점을 가진 영화 이름
    SELECT title AS results
    FROM movies
    WHERE movie_id IN (SELECT movie_id
                       FROM avg_rating
                       WHERE avg_movierating = (SELECT MAX(avg_movierating)
                                                FROM avg_rating
                                                )
                       )
    ORDER BY title
    LIMIT 1
)

SELECT *
FROM greatest_rating_user_name

UNION ALL

SELECT *
FROM greatest_rating_movie_name;



-- 방법2) JOIN
WITH greatest_rating_user_name AS ( -- 가장 많은 평점을 남긴 유저 이름
    SELECT u.name AS results
    FROM movierating AS mr
        INNER JOIN users AS u ON mr.user_id = u.user_id
    GROUP BY u.name
    ORDER BY COUNT(*) DESC
        , u.name
    LIMIT 1
)
, greatest_rating_movie_name AS ( -- 가장 높은 평균 평점을 가진 영화 이름
    SELECT m.title AS results
    FROM movierating AS mr
        INNER JOIN movies AS m ON mr.movie_id = m.movie_id
    WHERE DATE_FORMAT(mr.created_at, '%Y-%m') = '2020-02'
    GROUP BY m.title
    ORDER BY AVG(mr.rating) DESC
        , m.title
    LIMIT 1
)

SELECT *
FROM greatest_rating_user_name

UNION ALL

SELECT *
FROM greatest_rating_movie_name;
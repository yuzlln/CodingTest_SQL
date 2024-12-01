WITH count AS ( -- hacker_id, name별 challenges 개수
    SELECT h.hacker_id
        , h.name
        , COUNT(*) AS challenges_created
    FROM hackers AS h
        INNER JOIN challenges AS c ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id
        , h.name
)

SELECT hacker_id
    , name
    , challenges_created
FROM count
WHERE challenges_created = (SELECT MAX(challenges_created) -- challenges_created가 max인 데이터와
                             FROM count
                            )
    OR challenges_created IN (SELECT challenges_created -- cahllenges_created가 1개인 데이터
                              FROM count
                              GROUP BY challenges_created
                              HAVING COUNT(*) = 1
                             )
ORDER BY challenges_created DESC
    , hacker_id;
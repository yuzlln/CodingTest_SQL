WITH count AS ( -- hacker_id별 challenges 개수
    SELECT hacker_id
        , COUNT(*) AS challenges_created
    FROM challenges
    GROUP BY hacker_id
)

SELECT h.hacker_id
    , h.name
    , c.challenges_created
FROM count AS c
    INNER JOIN hackers AS h ON c.hacker_id = h.hacker_id
WHERE c.challenges_created = (SELECT MAX(challenges_created) -- challenges_created가 max인 데이터와
                              FROM count
                              )
    OR c.challenges_created IN (SELECT challenges_created -- cahllenges_created가 1개인 데이터
                                FROM count
                                GROUP BY challenges_created
                                HAVING COUNT(challenges_created) = 1
                                )
ORDER BY c.challenges_created DESC
    , h.hacker_id;

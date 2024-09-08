SELECT h.hacker_id
    , MAX(h.name) AS name
    , SUM(s.total_score) AS total_score
FROM hackers AS h
    INNER JOIN (SELECT hacker_id
                    , challenge_id
                    , MAX(score) AS total_score
                FROM submissions
                GROUP BY hacker_id
                    , challenge_id
                ) AS s ON h.hacker_id = s.hacker_id
GROUP BY h.hacker_id
HAVING total_score > 0
ORDER BY total_score DESC
    , h.hacker_id;

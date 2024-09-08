SELECT CASE WHEN id % 2 = 1 AND id = (SELECT COUNT(*)
                                      FROM seat
                                      ) THEN id   -- 마지막 값
            WHEN id % 2 = 0 THEN id - 1           -- 짝수
            ELSE id + 1 END AS id                 -- 홀수
    , student
FROM seat
ORDER BY id;

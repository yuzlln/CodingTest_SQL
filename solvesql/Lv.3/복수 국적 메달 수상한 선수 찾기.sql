SELECT a.name
FROM records AS r
  INNER JOIN athletes AS a ON r.athlete_id = a.id
  INNER JOIN games AS g ON r.game_id = g.id
WHERE g.year >= 2000
   AND r.medal IS NOT NULL -- 메달 수상 기록만 고려
-- a.name으로 GROUP BY시 동일인물이 추출 될 수 있음 (ex. 이름은 Chen Jing으로 같지만 선수id는 다르므로 다른 선수)
-- 완전 unique한 선수id로 GROUP BY 
GROUP BY a.id
HAVING COUNT(DISTINCT r.team_id) >= 2 -- 2개 이상의 국적
ORDER BY a.name;

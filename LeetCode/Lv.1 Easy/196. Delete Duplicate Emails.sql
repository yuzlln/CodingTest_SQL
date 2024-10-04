-- 방법 1) Window Function				
DELETE FROM person
WHERE id IN (SELECT id
             FROM (SELECT *
                       , ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) AS num
                   FROM person
                   ) AS t
              WHERE num >= 2
             );
             
             
             
-- 방법 2) FROM절 서브쿼리
DELETE FROM person
WHERE id NOT IN (SELECT sub.min_id
		 FROM (SELECT email
		           , MIN(id) as min_id
		       FROM person
		       GROUP BY email
		       ) AS sub
		);

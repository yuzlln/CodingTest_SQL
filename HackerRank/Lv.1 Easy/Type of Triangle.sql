SELECT CASE WHEN 2 * GREATEST(a, b, c) >= a + b + c THEN 'Not A Triangle' -- 삼각형을 형성하지 않을 조건
            WHEN a = b AND b = c THEN 'Equilateral' -- 연속적인 등호 두 개를 인식하지 않으므로, AND 연산자를 사용해 각각의 조건을 연결
            WHEN a = b OR b = c OR a = c THEN 'Isosceles'
            ELSE 'Scalene' END AS tri
FROM triangles;
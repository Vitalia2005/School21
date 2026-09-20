WITH RECURSIVE routes AS (
    SELECT 
        point2 AS current_point,
        cost AS total_cost,
        '{' || point1 || ',' || point2 AS tour,
        1 AS step_count
    FROM nodes
    WHERE point1 = 'a'

    UNION ALL
    SELECT 
        n.point2,
        r.total_cost + n.cost,
        r.tour || ',' || n.point2,
        r.step_count + 1
    FROM routes r
    JOIN nodes n ON r.current_point = n.point1
    WHERE 
        (r.step_count < 3 AND n.point2 != 'a' AND r.tour NOT LIKE '%,' || n.point2 || '%')
        OR (r.step_count = 3 AND n.point2 = 'a')
),
all_tours AS (
    SELECT total_cost, tour || '}' AS tour
    FROM routes
    WHERE current_point = 'a' AND step_count = 4
)
SELECT total_cost, tour
FROM all_tours
WHERE total_cost = (SELECT MIN(total_cost) FROM all_tours)
ORDER BY total_cost, tour;
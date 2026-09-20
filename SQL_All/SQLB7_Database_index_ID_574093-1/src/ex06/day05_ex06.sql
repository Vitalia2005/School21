DROP INDEX IF EXISTS idx_1;
CREATE INDEX idx_1 ON pizzeria (id, rating);
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON pz.id = m.pizzeria_id
ORDER BY 1,2;
SET enable_seqscan = OFF;
EXPLAIN (ANALYZE, BUFFERS) 
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu m
INNER JOIN pizzeria pz ON pz.id = m.pizzeria_id
ORDER BY 1,2;

SELECT count(*) = 1 AS check
FROM pg_tables
WHERE tablename = 'person_discounts'
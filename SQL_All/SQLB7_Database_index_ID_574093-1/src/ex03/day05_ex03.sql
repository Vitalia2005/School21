CREATE INDEX idx_person_order_multi ON person_order (person_id, menu_id, order_date);
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 1 AND menu_id = 2;
SET enable_seqscan = OFF;
EXPLAIN (ANALYZE, BUFFERS) 
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 1 AND menu_id = 2;
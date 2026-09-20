CREATE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);
SELECT pizzeria_id, pizza_name, price
FROM menu
WHERE pizzeria_id = 2 AND pizza_name = 'cheese pizza';
SET enable_seqscan = OFF;
EXPLAIN (ANALYZE, BUFFERS) 
SELECT pizzeria_id, pizza_name, price
FROM menu
WHERE pizzeria_id = 2 AND pizza_name = 'cheese pizza';
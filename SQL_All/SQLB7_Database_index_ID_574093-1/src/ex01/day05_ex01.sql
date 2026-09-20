SELECT 
    m.pizza_name, 
    p.name as pizzeria_name
FROM menu m
JOIN pizzeria p ON p.id = m.pizzeria_id;
SET enable_seqscan = OFF;
EXPLAIN ANALYZE 
SELECT 
    m.pizza_name, 
    p.name as pizzeria_name
FROM menu m
JOIN pizzeria p ON p.id = m.pizzeria_id;


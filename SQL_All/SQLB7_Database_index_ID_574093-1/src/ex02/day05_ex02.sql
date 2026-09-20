CREATE INDEX idx_person_name ON person (UPPER(name));
SELECT 
    p.name,
    po.order_date
FROM person p
LEFT JOIN person_order po ON po.person_id = p.id
WHERE UPPER(p.name) = 'ANDREY';
SET enable_seqscan = OFF;
EXPLAIN ANALYZE 
SELECT 
    p.name,
    po.order_date
FROM person p
LEFT JOIN person_order po ON po.person_id = p.id
WHERE UPPER(p.name) = 'ANDREY';
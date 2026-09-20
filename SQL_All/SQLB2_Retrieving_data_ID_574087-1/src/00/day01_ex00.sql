SELECT m.id as object_id, m.pizza_name as object_name FROM menu m
union all
select p.id as object_id, p.name as object_name FROM person p
ORDER BY object_id, object_name;
(select p.name as object_name FROM person p
ORDER BY object_name)
union all
(SELECT m.pizza_name as object_name FROM menu m ORDER BY object_name)

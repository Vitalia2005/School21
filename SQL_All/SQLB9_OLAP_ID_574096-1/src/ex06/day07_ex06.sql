SELECT 
    p.name,
    count(*) AS count_of_orders,
    round(avg(m.price), 2) AS average_price,
    max(m.price) AS max_price,
    min(m.price) AS min_price
FROM person_order
INNER JOIN menu m ON person_order.menu_id = m.id
INNER JOIN pizzeria p ON m.pizzeria_id = p.id
GROUP BY p.name
ORDER BY 1;        
SELECT DISTINCT pz.name AS pizzeria_name
FROM person p
    JOIN person_visits pv ON pv.person_id = p.id
    JOIN pizzeria pz ON pz.id = pv.pizzeria_id
WHERE p.name = 'Andrey' AND pz.id NOT IN (
        SELECT DISTINCT m.pizzeria_id
        FROM person_order po
        JOIN menu m ON m.id = po.menu_id 
        WHERE po.person_id = p.id
    )
ORDER BY 1;
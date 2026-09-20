(
    SELECT DISTINCT pz.name AS pizzeria_name
    FROM person_order po
        JOIN person p ON p.id = po.person_id
        JOIN menu m ON m.id = po.menu_id
        JOIN pizzeria pz ON pz.id = m.pizzeria_id
    WHERE p.gender = 'female'
    EXCEPT
    SELECT DISTINCT pz.name AS pizzeria_name
    FROM person_order po
        JOIN person p ON p.id = po.person_id
        JOIN menu m ON m.id = po.menu_id
        JOIN pizzeria pz ON pz.id = m.pizzeria_id
    WHERE p.gender = 'male'
)
UNION
(
    SELECT DISTINCT pz.name AS pizzeria_name
    FROM person_order po
        JOIN person p ON p.id = po.person_id
        JOIN menu m ON m.id = po.menu_id
        JOIN pizzeria pz ON pz.id = m.pizzeria_id
    WHERE p.gender = 'male'
    EXCEPT
    SELECT DISTINCT pz.name AS pizzeria_name
    FROM person_order po
        JOIN person p ON p.id = po.person_id
        JOIN menu m ON m.id = po.menu_id
        JOIN pizzeria pz ON pz.id = m.pizzeria_id
    WHERE p.gender = 'female'
)
ORDER BY 1;
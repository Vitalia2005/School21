(
    SELECT pz.name AS pizzeria_name
    FROM person_visits pv
        JOIN person p ON p.id = pv.person_id
        JOIN pizzeria pz ON pz.id = pv.pizzeria_id
    WHERE p.gender = 'female'  
    EXCEPT ALL   
    SELECT pz.name AS pizzeria_name
    FROM person_visits pv
        JOIN person p ON p.id = pv.person_id
        JOIN pizzeria pz ON pz.id = pv.pizzeria_id
    WHERE p.gender = 'male'
)
UNION ALL
(
    SELECT pz.name AS pizzeria_name
    FROM person_visits pv
        JOIN person p ON p.id = pv.person_id
        JOIN pizzeria pz ON pz.id = pv.pizzeria_id
    WHERE p.gender = 'male'
    EXCEPT ALL
    SELECT pz.name AS pizzeria_name
    FROM person_visits pv
        JOIN person p ON p.id = pv.person_id
        JOIN pizzeria pz ON pz.id = pv.pizzeria_id 
    WHERE p.gender = 'female'
)
ORDER BY 1;
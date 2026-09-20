SELECT 
    order_date,
    name || ' (age:' || age || ')' AS person_information
FROM (
    SELECT id AS person_id, name, age 
    FROM person
) AS p
NATURAL JOIN person_order
ORDER BY order_date ASC, person_information ASC;
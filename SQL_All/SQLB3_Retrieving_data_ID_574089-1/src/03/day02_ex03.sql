WITH date_generator AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval)::date AS missing_date
)
SELECT dg.missing_date
FROM date_generator dg
LEFT JOIN person_visits pv 
    ON dg.missing_date = pv.visit_date AND (pv.person_id = 1 OR pv.person_id = 2)
WHERE pv.id IS NULL
ORDER BY dg.missing_date;
CREATE VIEW v_generated_dates AS
SELECT 
    generate_series(
        '2022-01-01'::date,
        '2022-01-31'::date,
        '1 day'::interval
    )::date AS generated_date
ORDER BY 1;


SELECT count(*) = 31 AS CHECK,
      min(generated_date) AS check1,
      max(generated_date) AS check2
FROM v_generated_dates;
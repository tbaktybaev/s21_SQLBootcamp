--03
WITH cte AS
(
       SELECT series.date                                                   AS missing_date
       FROM   generate_series('2022-01-01', '2022-01-10', interval '1 day') AS series )
SELECT    c.missing_date
FROM      cte c
LEFT JOIN
          (
                 SELECT visit_date
                 FROM   person_visits pv
                 WHERE  pv.person_id = 1
                 OR     person_id = 2) AS vd
ON        c.missing_date = vd.visit_date
WHERE     vd.visit_date IS NULL
ORDER BY  missing_date ASC;
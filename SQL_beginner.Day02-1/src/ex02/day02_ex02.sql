--02
SELECT    COALESCE(p.NAME, '-') AS person_name,
          pv.visit_date,
          COALESCE(pz.NAME, '-') AS pizzeria_name
FROM      person p
FULL JOIN
          (
                 SELECT *
                 FROM   person_visits pv
                 WHERE  visit_date BETWEEN '2022-01-01' AND    '2022-01-03') pv
ON        p.id = pv.person_id
FULL JOIN pizzeria pz
ON        pv.pizzeria_id = pz.id
ORDER BY  1,
          2,
          3;
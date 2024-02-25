--day00_ex09.sql
SELECT (SELECT NAME
        FROM   person
        WHERE  id = pv.person_id)   AS person_name, -- this is an internal query in a main SELECT clause
       (SELECT NAME
        FROM   pizzeria
        WHERE  id = pv.pizzeria_id) AS pizzeria_name -- this is an internal query in a main SELECT clause
FROM   (SELECT *
        FROM   person_visits
        WHERE  visit_date BETWEEN '2022-01-07' AND '2022-01-09') AS pv -- this is an internal query in a main FROM clause
ORDER  BY person_name ASC,
          pizzeria_name DESC; 
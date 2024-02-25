--01
SELECT m.pizza_name,
       m.price,
       pz.NAME,
       pv.visit_date
FROM   menu m
       JOIN pizzeria pz
         ON m.pizzeria_id = pz.id
       JOIN person_visits pv
         ON m.pizzeria_id = pv.pizzeria_id
       JOIN person p
         ON pv.person_id = p.id
WHERE  p.NAME LIKE 'Kate'
       AND m.price BETWEEN 800 AND 1000
ORDER  BY 1,
          2,
          3;
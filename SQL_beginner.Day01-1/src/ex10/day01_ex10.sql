--10
SELECT p.name       AS person_name,
       m.pizza_name AS pizza_name,
       pz.name      AS pizzeria_name
FROM   person p
       INNER JOIN person_order po
               ON p.id = po.person_id
       INNER JOIN menu m
               ON po.menu_id = m.id
       INNER JOIN pizzeria pz
               ON m.pizzeria_id = pz.id
ORDER  BY person_name,
          pizza_name,
          pizzeria_name; 
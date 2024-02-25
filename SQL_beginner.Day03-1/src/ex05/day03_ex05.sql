--05
SELECT pizzeria.NAME AS pizzeria_name
FROM   person_visits
       LEFT JOIN person_order
              ON person_visits.visit_date = person_order.order_date
                 AND person_visits.person_id = person_order.person_id
       JOIN person
         ON person_visits.person_id = person.id
       JOIN pizzeria
         ON person_visits.pizzeria_id = pizzeria.id
WHERE  order_date IS NULL
       AND person.NAME LIKE 'Andrey'
ORDER  BY 1;
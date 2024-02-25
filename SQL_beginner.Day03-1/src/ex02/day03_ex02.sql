SELECT menu.pizza_name,
       menu.price,
       piz.NAME AS pizzeria_name
FROM   menu
       JOIN pizzeria piz
         ON menu.pizzeria_id = piz.id
WHERE  menu.id NOT IN (SELECT DISTINCT menu_id
                       FROM   person_order)
ORDER  BY 1,
          2; 
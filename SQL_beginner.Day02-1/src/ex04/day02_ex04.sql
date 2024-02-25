--04
SELECT     m.pizza_name,
           pz.NAME AS pizzeria_name,
           m.price
FROM       pizzeria pz
INNER JOIN menu m
ON         pz.id = m.pizzeria_id
WHERE      pizza_name LIKE '%mushroom%'
OR         pizza_name LIKE '%pepperoni%'
ORDER BY   1,
           2;

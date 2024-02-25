--06
SELECT     m.pizza_name,
           pz.NAME AS pizzeria_name
FROM       person_order po
INNER JOIN person p
ON         po.person_id = p.id
INNER JOIN menu m
ON         po.menu_id = m.id
INNER JOIN pizzeria pz
ON         m.pizzeria_id = pz.id
WHERE      p.NAME IN ('Denis',
                      'Anna')
ORDER BY   1,
           2;
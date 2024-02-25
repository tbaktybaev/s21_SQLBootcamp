--09
SELECT     p.NAME
FROM       person_order po
INNER JOIN person p
ON         po.person_id = p.id
INNER JOIN menu m
ON         po.menu_id = m.id
WHERE      p.gender LIKE 'female'
AND        m.pizza_name = 'pepperoni pizza'
INTERSECT
SELECT     p.NAME
FROM       person_order po
INNER JOIN person p
ON         po.person_id = p.id
INNER JOIN menu m
ON         po.menu_id = m.id
WHERE      p.gender LIKE 'female'
AND        m.pizza_name = 'cheese pizza'
ORDER BY   1 ASC;
--08
SELECT     p.NAME
FROM       person_order po
INNER JOIN person p
ON         po.person_id = p.id
INNER JOIN menu m
ON         po.menu_id = m.id
WHERE      p.gender LIKE 'male'
AND        p.address IN ('Moscow',
                         'Samara')
AND        m.pizza_name IN ('pepperoni pizza',
                            'mushroom pizza')
ORDER BY   1 DESC;
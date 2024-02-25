--06
SELECT visit_date AS action_date,
       p.name
FROM   person_visits pv
       INNER JOIN person p
               ON pv.person_id = p.id
INTERSECT
SELECT order_date AS action_date,
       p.name     AS name
FROM   person_order po
       INNER JOIN person p
               ON po.person_id = p.id
ORDER  BY action_date asc,
          name desc;
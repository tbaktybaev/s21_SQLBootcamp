--06
CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT     pz.NAME AS pizzeria_name
FROM       menu m
INNER JOIN pizzeria pz
ON         m.pizzeria_id = pz.id
INNER JOIN person_visits pv
ON         pz.id = pv.pizzeria_id
INNER JOIN person pn
ON         pv.person_id = pn.id
AND        pv.visit_date = '2022-01-08'
AND        m.price < 800;


--00
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
       AND m.price BETWEEN 800 AND 1000;

--01
SELECT DISTINCT m.id
FROM   menu m
       LEFT JOIN person_order po
              ON m.id = po.menu_id
WHERE  po.menu_id IS NULL
ORDER  BY m.id;

--03 
WITH cte
     AS (SELECT pizzeria.NAME,
                gender,
                Count(*) AS visit_count
         FROM   person_visits
                JOIN pizzeria
                  ON person_visits.pizzeria_id = pizzeria.id
                JOIN person
                  ON person_visits.person_id = person.id
         GROUP  BY pizzeria.NAME,
                   gender
         ORDER  BY pizzeria.NAME)
SELECT DISTINCT c1.NAME
FROM   cte c1
       JOIN cte c2
         ON c1.NAME = c2.NAME
            AND c1.gender != c2.gender
            AND c1.visit_count != c2.visit_count;

--04
SELECT *
FROM   person_visits
       JOIN pizzeria
         ON person_visits.pizzeria_id = pizzeria.id
       JOIN person
         ON person_visits.person_id = person.id

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

--06
SELECT m1.pizza_name,
       pz1.NAME AS pizzeria_name1,
       pz2.NAME AS pizzeria_name2,
       m1.price
FROM   menu m1
       JOIN menu m2
         ON m1.pizza_name = m2.pizza_name
            AND m1.price = m2.price
            AND m1.pizzeria_id > m2.pizzeria_id
       JOIN pizzeria pz1
         ON m1.pizzeria_id = pz1.id
       JOIN pizzeria pz2
         ON m2.pizzeria_id = pz2.id
ORDER  BY m1.pizza_name;

--07
INSERT INTO menu
            (id,
             pizzeria_id,
             pizza_name,
             price)
VALUES      (19,
             2,
             'greek pizza',
             800);

SELECT *
FROM   menu;

--08
INSERT INTO menu
            (id,
             pizzeria_id,
             pizza_name,
             price)
VALUES      ((SELECT Max(id) + 1
              FROM   menu),
             (SELECT id
              FROM   pizzeria
              WHERE  NAME = 'Dominos'),
             'sicilian pizza',
             900);

SELECT *
FROM   menu;

--09
INSERT INTO person_visits
VALUES      ((SELECT Max(id) + 1
              FROM   person_visits),
             (SELECT id
              FROM   person
              WHERE  NAME = 'Denis'),
             (SELECT id
              FROM   pizzeria
              WHERE  NAME = 'Dominos'),
             '2022-02-24');

INSERT INTO person_visits
VALUES      ((SELECT Max(id) + 1
              FROM   person_visits),
             (SELECT id
              FROM   person
              WHERE  NAME = 'Irina'),
             (SELECT id
              FROM   pizzeria
              WHERE  NAME = 'Dominos'),
             '2022-02-24');

SELECT *
FROM   person_visits;

--10
INSERT INTO person_order
VALUES      ((SELECT Max(id) + 1
              FROM   person_order),
             (SELECT id
              FROM   person
              WHERE  NAME = 'Denis'),
             (SELECT id
              FROM   menu
              WHERE  pizza_name = 'sicilian pizza'),
             '2022-02-24');

INSERT INTO person_order
VALUES      ((SELECT Max(id) + 1
              FROM   person_order),
             (SELECT id
              FROM   person
              WHERE  NAME = 'Irina'),
             (SELECT id
              FROM   menu
              WHERE  pizza_name = 'sicilian pizza'),
             '2022-02-24');

SELECT *
FROM   person_order;

--11
UPDATE menu
SET    price = price * 0.9
WHERE  pizza_name = 'greek pizza';

SELECT *
FROM   menu;

--12
INSERT INTO person_order
            (id,
             person_id,
             menu_id,
             order_date)
SELECT menu_id,
       person.id                           AS person_id,
       (SELECT id
        FROM   menu
        WHERE  pizza_name = 'greek pizza') AS mid,
       '2022-02-25'
FROM   Generate_series((SELECT Max(id)
                        FROM   person_order)
                       + 1, (SELECT Max(id)
                             FROM   person_order)
                            + (SELECT Count(id)
                               FROM   person), 1) AS menu_id
       JOIN person
         ON menu_id = person.id
                      + (SELECT Max(id)
                         FROM   person_order);

SELECT *
FROM   person_order;

--13 
DELETE FROM person_order
WHERE  order_date = '2022-02-25';

DELETE FROM menu
WHERE  pizza_name LIKE 'greek pizza'; 
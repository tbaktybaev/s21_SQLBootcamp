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

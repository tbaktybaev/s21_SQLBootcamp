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
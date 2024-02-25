--07
INSERT INTO person_visits
VALUES      ((SELECT Max(id) + 1
              FROM   person_visits),
             (SELECT id
              FROM   person
              WHERE  NAME = 'Dmitriy'),
             (SELECT id
              FROM   pizzeria
              WHERE  NAME = 'Best Pizza'),
             '2022-01-08');
			 
SELECT * FROM mv_dmitriy_visits_and_eats;
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
SELECT * FROM mv_dmitriy_visits_and_eats;


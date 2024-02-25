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
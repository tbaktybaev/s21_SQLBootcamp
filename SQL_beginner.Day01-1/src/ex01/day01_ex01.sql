--01
SELECT name AS object_name
FROM   ((SELECT id,
                name
         FROM   person
         ORDER  BY name)
        UNION ALL
        (SELECT id,
                pizza_name AS name
         FROM   menu
         ORDER  BY name));
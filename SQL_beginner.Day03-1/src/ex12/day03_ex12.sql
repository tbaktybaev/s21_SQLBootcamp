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

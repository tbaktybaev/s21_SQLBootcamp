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

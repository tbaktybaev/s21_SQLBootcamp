--day00_ex05.sql
SELECT (SELECT NAME
        FROM   person
        WHERE  id = person_order.person_id) AS NAME -- this is an internal query in a main SELECT clause
FROM   person_order
WHERE  ( menu_id = 13
          OR menu_id = 14
          OR menu_id = 18 )
       AND order_date = '2022-01-07'
ORDER  BY NAME;
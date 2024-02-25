--08 
SELECT order_date,
       name
       || ' (age:'
       || age
       || ')' AS person_information
FROM   person_order
       NATURAL JOIN (SELECT id AS person_id,
                            name,
                            age
                     FROM   person)
ORDER  BY order_date asc,
          person_information asc;
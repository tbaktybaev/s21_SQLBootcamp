--day00_ex01.sql
SELECT NAME,
       age
FROM   person
WHERE  address LIKE 'Kazan'
       AND gender LIKE 'female'
ORDER  BY NAME;
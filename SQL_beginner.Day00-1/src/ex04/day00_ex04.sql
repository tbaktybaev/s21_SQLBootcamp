--day00_ex04.sql
SELECT NAME
       || ' (age:'
       || age
       || ','
       || 'gender:'
       || gender
       || ','
       || 'address:'
       || address
       || ')' AS person_information
FROM   person;
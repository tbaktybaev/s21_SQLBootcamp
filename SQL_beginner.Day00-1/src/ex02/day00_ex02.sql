--day00_ex02.sql
SELECT NAME,
       rating
FROM   pizzeria
WHERE  rating >= 3.5
       AND rating <= 5;

SELECT NAME,
       rating
FROM   pizzeria
WHERE  rating BETWEEN 3.5 AND 5;
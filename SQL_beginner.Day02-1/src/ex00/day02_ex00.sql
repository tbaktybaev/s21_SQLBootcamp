--00
SELECT    pz.NAME,
          pz.rating
FROM      pizzeria pz
LEFT JOIN person_visits pv
ON        pz.id = pv.pizzeria_id
WHERE     pv.person_id IS NULL;

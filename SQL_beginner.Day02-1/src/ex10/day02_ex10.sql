--10
SELECT     p1.NAME,
           p2.NAME,
           p1.address AS common_address
FROM       person p1
INNER JOIN person p2
ON         p1.address = p2.address
AND        p1.id > p2.id
ORDER BY   1,
           2,
           3;
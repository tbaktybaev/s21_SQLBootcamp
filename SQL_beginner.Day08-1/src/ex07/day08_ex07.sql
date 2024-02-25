-- #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
update pizzeria set rating = 4 where name = 'Dominos';
update pizzeria set rating = 4 where name = 'Pizza Hut';
commit;
select sum(rating) from pizzeria;
-- #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
update pizzeria set rating = 3 where name = 'Pizza Hut';
update pizzeria set rating = 3 where name = 'Dominos';
commit;
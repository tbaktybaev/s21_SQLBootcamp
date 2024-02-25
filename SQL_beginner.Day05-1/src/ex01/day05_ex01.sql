--01 
set enable_seqscan=off;
explain analyse 
select m.pizza_name, pz.name as pizzeria_name
from menu m join pizzeria pz on m.pizzeria_id = pz.id;


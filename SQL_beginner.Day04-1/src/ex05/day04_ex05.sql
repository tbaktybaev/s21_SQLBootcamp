--05
create OR REPLACE view v_price_with_discount as 
select p.name, m.pizza_name, m.price, (m.price - m.price * 0.1)::integer as discount_price 
from person_order po join person p on po.person_id = p.id
	join menu m on po.menu_id = m.id
order by 1, 2;

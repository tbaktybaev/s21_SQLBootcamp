--01
select p.name, count(*) as count_of_visits
from person_visits pv join person p on pv.person_id = p.id
group by p.name
order by count_of_visits desc, p.name asc
limit 4;
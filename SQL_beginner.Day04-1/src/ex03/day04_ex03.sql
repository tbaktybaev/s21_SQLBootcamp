--03 
select vgd.generated_date as missing_date
from v_generated_dates vgd left join person_visits pv 
    on vgd.generated_date = pv.visit_date
where pv.visit_date is null
ORDER BY missing_date;
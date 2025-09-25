with prev_data as(select *,
lag(temperature) over (order by recordDate) as prev_temp,
lag(recordDate) over (order by recordDate) as prev_date
from weather)
select id from prev_data
where datediff(recordDate,prev_date) = 1 and 
temperature>prev_temp;
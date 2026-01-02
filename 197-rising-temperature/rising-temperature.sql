with cte as(select *,
lag(temperature) over (order by recorddate asc) as prev_temp,
lag(recorddate) over (order by recorddate asc) as prev_date
from weather)
select id
from cte
where temperature>prev_temp and datediff(recorddate,prev_date) = 1;
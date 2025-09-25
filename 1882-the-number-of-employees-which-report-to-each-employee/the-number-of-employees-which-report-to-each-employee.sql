select a.reports_to as employee_id,b.name,count(a.reports_to) as reports_count,round(avg(a.age),0) as average_age
from employees as a
join employees as b on a.reports_to = b.employee_id
group by a.reports_to
having count(*) >= 1
order by employee_id;
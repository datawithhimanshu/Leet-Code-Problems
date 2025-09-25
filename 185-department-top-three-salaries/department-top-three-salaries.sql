with ranking as(select d.name as Department,e.name as Employee, e.salary as Salary,
dense_rank() over (partition by e.departmentid order by e.salary desc)as rnk 
from employee as e
join department as d on e.departmentid = d.id)
select Department, Employee, Salary
from ranking
where rnk<=3;
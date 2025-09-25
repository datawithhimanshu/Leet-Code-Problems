select employee_id , department_id from employee
where primary_flag = 1
union
select employee_id, max(department_id) as department_id
from employee
group by employee_id
having count(*) = 1;
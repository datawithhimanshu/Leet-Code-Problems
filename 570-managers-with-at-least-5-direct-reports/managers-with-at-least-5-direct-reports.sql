# Write your MySQL query statement below
select name from Employee
where id in (select managerId from employee
group by managerid
having count(*)>=5)
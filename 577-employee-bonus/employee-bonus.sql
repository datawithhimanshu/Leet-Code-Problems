# Write your MySQL query statement below
select a.name,b.bonus
from Employee as a
left join Bonus as b on a.empid = b.empid
where b.bonus < 1000 or b.bonus is null;
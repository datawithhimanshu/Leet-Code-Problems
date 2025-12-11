# Write your MySQL query statement below
with cte as(select *,
sum(Weight) over (order by Turn) as Total_Weight
from Queue)
select person_name from cte
where total_weight<=1000
order by turn desc
limit 1;
with daily_amount as(select visited_on, sum(amount) as amount
from customer
group by visited_on),
rolling as(select visited_on,
sum(amount) over (order by visited_on rows between 6 preceding and current row) as amount,
round(avg(amount) over (order by visited_on rows between 6 preceding and current row),2) as average_amount,
count(*) over (order by visited_on rows between 6 preceding and current row) as cnt 
from daily_amount)
select visited_on, amount, average_amount from rolling where cnt = 7
order by visited_on;

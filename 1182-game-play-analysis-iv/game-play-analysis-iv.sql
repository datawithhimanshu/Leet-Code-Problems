with cte as(select player_id, min(event_date) as first_login
from activity
group by player_id)
select round(count(a.player_id)/(select count(distinct player_id) from activity),2) as fraction
from activity as a
join cte as c on datediff(a.event_date,c.first_login) = 1 and a.player_id = c.player_id;
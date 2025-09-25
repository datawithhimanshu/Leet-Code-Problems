with cte as(select requester_id,accepter_id from requestaccepted
union all
select accepter_id,requester_id from requestaccepted)
select requester_id as id, count(*) as num
from cte
group by requester_id
order by count(*) desc
limit 1;
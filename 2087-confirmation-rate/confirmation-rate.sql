select a.user_id,
round(count(case when b.action = 'confirmed' then 1 else null end)/count(*),2) as confirmation_rate
from signups as a
left join confirmations as b on a.user_id = b.user_id
group by a.user_id;
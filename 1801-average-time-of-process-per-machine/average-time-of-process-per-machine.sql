# Write your MySQL query statement below
with cte as(select machine_id, process_id,
max(case when activity_type = "start" then timestamp end) as start_timestamp,
max(case when activity_type = "end" then timestamp end) as end_timestamp
from activity
group by machine_id, process_id)
select machine_id, round(avg(end_timestamp - start_timestamp),3) as processing_time
from cte
group by machine_id;
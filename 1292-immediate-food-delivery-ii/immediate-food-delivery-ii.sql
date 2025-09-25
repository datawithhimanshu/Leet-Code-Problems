with cte as (select customer_id,min(order_date) as first_order_date
from delivery
group by customer_id)
select round(sum(case when d.order_date = d.customer_pref_delivery_date then 1 else 0 end)/count(*) * 100, 2) as immediate_percentage
from delivery as d
join cte as c on d.customer_id = c.customer_id and d.order_date = c.first_order_date;
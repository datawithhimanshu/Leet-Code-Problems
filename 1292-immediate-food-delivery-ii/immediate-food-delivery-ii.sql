with first_visit as(select customer_id, min(order_date) as first_order
from delivery
group by customer_id)
select round(count(case when fv.first_order = d.customer_pref_delivery_date then 1 else null end)/count(*) * 100, 2) as immediate_percentage
from first_visit as fv
join delivery as d on d.customer_id = fv.customer_id and fv.first_order = d.order_date;
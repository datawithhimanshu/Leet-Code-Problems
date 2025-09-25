with cte as(select product_id,new_price,
rank() over (partition by product_id order by change_date desc) as rnk
from products
where change_date <= '2019-08-16'),
all_products as (select distinct product_id from products)
select a.product_id, coalesce(c.new_price,10) as price from all_products as a
left join cte as c on a.product_id = c.product_id and c.rnk = 1;

# Write your MySQL query statement below
with cte as(select *,
row_number() over (partition by product_id order by change_date desc) as rn
from products
where change_date<= '2019-08-16'),
all_product as (select distinct product_id from products)
select a.product_id, coalesce(c.new_price,10) as price
from all_product as a
left join cte as c on a.product_id = c.product_id and c.rn = 1;
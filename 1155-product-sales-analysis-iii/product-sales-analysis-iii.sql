with firstyear as(select product_id,min(year) as first_year
from sales
group by product_id)
select s.product_id,f.first_year,s.quantity,s.price
from sales as s
join firstyear as f on s.product_id = f.product_id and s.year = f.first_year;
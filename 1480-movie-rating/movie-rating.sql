(select u.name as results from movierating as mr
left join users as u on mr.user_id = u.user_id
group by u.name
order by count(mr.rating) desc, u.name asc
limit 1)
union all
(select m.title as results from movierating as mr
left join movies as m on mr.movie_id = m.movie_id
where month(created_at) = 2 and year(created_at) = 2020
group by m.title
order by avg(mr.rating) desc,m.title asc
limit 1);
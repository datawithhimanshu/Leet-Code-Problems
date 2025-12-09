with cte as(select *
from Students
cross join Subjects)
select c.student_id,c.student_name,c.subject_name,count(e.student_id) as attended_exams
from cte as c
left join examinations as e on c.student_id = e.student_id and c.subject_name = e.subject_name
group by c.student_id,c.student_name,c.subject_name
order by c.student_id,c.subject_name;
select a.id
from weather as a
join weather as b on datediff(a.recordDate,b.recorddate) = 1
where a.temperature>b.temperature;

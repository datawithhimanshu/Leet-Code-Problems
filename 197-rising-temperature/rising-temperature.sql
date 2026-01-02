select a.id
from weather as a
join weather as b on datediff(a.recorddate,b.recorddate) = 1
and a.temperature > b.temperature;
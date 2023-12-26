select t.point, t.date, e.out, t.inc
from
(select point, date, sum(inc) as inc from Income group by point, date) as t
left outer join
(select point, date, sum(out) as out from Outcome group by point, date) as e
on t.point=e.point and t.date=e.date
union
select e.point, e.date, e.out, t.inc
from
(select point, date, sum(inc) as inc from Income group by point, date) as t
right outer join
(select point, date, sum(out) as out from Outcome group by point, date) as e
on t.point=e.point and t.date=e.date
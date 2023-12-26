Select country, convert(decimal (30,2), avg(bore*bore*bore/2)) as b
from (select c.country as country, convert(decimal (30,2), isnull(c.bore, 0)) as bore, s.name as name
from ships as s
join classes as c on s.class=c.class
union all
select distinct cc.country as country, convert(decimal (30,2), isnull(cc.bore, 0)) as bore, oo.ship as name
from Outcomes as oo 
join classes as cc on oo.ship=cc.class
where oo.ship not in (select name from ships)
) as t  
group by country
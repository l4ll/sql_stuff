with bs as
(select distinct outcomes.ship, outcomes.battle, outcomes.result, battles.date 
from outcomes join battles on outcomes.battle=battles.name
where battles.date is not null and battles.name is not null)

select distinct a.ship from bs as a 
where a.ship in
(select distinct b.ship from bs as b where b.date<a.date and b.result='damaged')
select class from
(select name, class from ships 
where name is not null or class is not null
union
select outcomes.ship, classes.class from outcomes join classes on outcomes.ship=classes.class 
where outcomes.ship is not null) as t
group by class having count(name)=1
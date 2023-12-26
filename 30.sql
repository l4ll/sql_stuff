/*
30. В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code), требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL). 
*/

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
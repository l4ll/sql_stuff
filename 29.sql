/*
29. В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход). Использовать таблицы Income_o и Outcome_o.
*/

select distinct Income_o.point, Income_o.date, Income_o.inc, Outcome_o.out
from Income_o left outer join Outcome_o on Income_o.point=Outcome_o.point and Income_o.date=Outcome_o.date
union
select distinct Outcome_o.point, Outcome_o.date, Income_o.inc, Outcome_o.out
from Income_o right outer join Outcome_o on Income_o.point=Outcome_o.point and Income_o.date=Outcome_o.date
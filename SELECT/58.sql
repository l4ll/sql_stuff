/*
58. Для каждого типа продукции и каждого производителя из таблицы Product c точностью до двух десятичных знаков найти процентное отношение числа моделей данного типа данного производителя к общему числу моделей этого производителя.
Вывод: maker, type, процентное отношение числа моделей данного типа к общему числу моделей производителя
*/

select c.maker, c.type, 
cast(coalesce((d.typemodels/d.allmodels)*100, 0) as numeric(6,2)) as divided
from 
(select maker, type from (select distinct maker from product) as a,
(select distinct type from Product) as b) as c
left join
(select a.maker, a.type, a.typemodels*1.0 as typemodels, b.allmodels*1.0 as allmodels from
(select maker, type, count(model) as typemodels from Product group by maker, type) as a, 
(Select maker, count(model) as allmodels from Product group by maker) as b 
where a.maker=b.maker) as d
on c.maker=d.maker and c.type=d.type
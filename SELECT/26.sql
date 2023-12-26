/*
26. Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена. 
*/

select avg(price) from
(select Pc.price from Product join PC on Product.model=PC.model
where Product.maker='A' and Product.type='PC'
union all
select Laptop.price from Product join Laptop on Product.model=Laptop.model 
where Product.maker='A' and Product.type='Laptop') as t
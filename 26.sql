select avg(price) from
(select Pc.price from Product join PC on Product.model=PC.model
where Product.maker='A' and Product.type='PC'
union all
select Laptop.price from Product join Laptop on Product.model=Laptop.model 
where Product.maker='A' and Product.type='Laptop') as t
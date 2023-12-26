with joinn as(
select Product.maker, PC.speed, PC.ram
from Product join PC on Product.model=PC.model
where Product.type='PC' and PC.ram=(select min(ram) from PC))

select distinct maker from Product 
where type='Printer' and maker in(
select maker from joinn 
where speed=(select max(speed) from joinn))
select model, type
from product
where model not like '%[^a-z]%'
or model not like '%[^0-9]%'
select
    gen3.ID
from ECOLI_DATA gen1
         inner join ECOLI_DATA gen2 on gen2.PARENT_ID = gen1.id and gen1.PARENT_ID is null
         inner join ECOLI_DATA gen3 on gen3.PARENT_ID = gen2.id
order by gen3.ID asc;
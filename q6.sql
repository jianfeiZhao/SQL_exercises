/*Consider a table T as follows T(id int, value int)

Example records
<id,VALUE>
1,4
2,6
3,10
4,5

So id always increases by a unit whereas value can be any number.

1)
Write a SQL query to generate output as follows:
<id1,id2,VALUE>
1,2,2
2,3,4
3,4,-5
*/
drop table T;

CREATE TABLE T (
  id INT,
  VALUE INT);
	
INSERT INTO T VALUES(1,4);
INSERT INTO T VALUES(2,6);
INSERT INTO T VALUES(3,10);
INSERT INTO T VALUES(4,5);

select A.id as id1, B.id as id2, B.VALUE - A.VALUE as VALUE
from T as A, T as B 
where A.id+1 = B.id;

/*
------
2)
write a SQL query to generate the difference between any two ids
include difference with itself

Write a SQL query to generate the difference between any two unequal ids

Write a query to generate output as follows:

2,1,-2
3,2,-4
4,3,5
*/
select A.id as id1, B.id as id2, B.value - A.value as VALUE
from T AS A, T AS B
where A.id = B.id OR A.id != B.id;

select A.id as id1, B.id as id2, B.value - A.value as VALUE
from T AS A, T AS B 
where A.id != B.id;

select A.id as id1, B.id as id2, -(A.VALUE - B.VALUE) as VALUE
from T as A, T as B 
where A.id-1 = B.id;

/*
------
3)
Modify the above query to generate the output such that
including the record only
when the difference is equal to the value in the record

for example
4,3,5

*/
select A.id as id1, B.id as id2, A.value - B.value as VALUE 
from T as A, T as B, T 
where A.id != B.id and A.value - B.value = T.value;
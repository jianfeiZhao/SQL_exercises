


/* student_roster.csv data CSV form:

S01, PHYSICS, 95

*/



Create table roster (student_id varchar(30), course_name varchar(30), score int);

Load data local infile '/home/data/sql.challenges/roster/student_roster.csv' 
into table roster 
fields terminated by ','
(student_id, course_name, score);



/* 
find all students who take the same course, order by student pair 
*/

select distinct A1.student_id, B1.student_id 
from roster as A1, roster as B1
where A1.course_name = B1.course_name and A1.student_id < B1.student_id 
order by A1.student_id;



/* 
find all students NOT taken cousre together, ORDER BY student pair 
*/

select distinct A2.student_id, B2.student_id
from roster as A2, roster as B2 
where A2.student_id < B2.student_id
having (A2.student_id, B2.student_id) not in
    (
    select C1.student_id, D1.student_id
    from roster as C1, roster as D1
    where C1.student_id < D1.student_id and C1.course_name = D1.course_name
		)
order by A2.student_id, B2.student_id;

/* 
find students got highest grade EVERY COURSE and ORDER BY student 
*/	
select course_name, student_id, score
from roster as r
where score = (
  select max(score)
  from roster as r1 
	where r.course_name = r1.course_name
	)
order by course_name, student_id;

/*
Find students who have scored the highest grade in at least one course they are taking, order by student.
*/
select distinct student_id
from roster as r
where score = (
  select max(score)
  from roster as r1 
  where r.course_name = r1.course_name
  )
order by student_id;

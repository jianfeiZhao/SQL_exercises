/*
load the data in bbclean.csv into table.

after loading create a second table which has three columns as follows
Zach Yuzon,ZACH.YUZON41@myhunter.cuny.edu,CS435-01
*/
create table class_info 
(name varchar(30), 
 email varchar(70),
 course varchar(30)
) charset = utf8;

load data local infile 'bbclean_clear.csv'
into table class_info
fields terminated by ','
optionally enclosed by ''
lines terminated by '\n';

update class_info set course=substring(course,1,length(course)-1);

/*
use the table you created in pq1.txt
List the number of students in each class
producing output like class,#of students.
*/
select course as class, count(course) as number_of_students
from class_info 
group by course;

/*
Use the table you created in pq1.txt
List the class which has the most number of students
*/
select course, count(course) as count 
from class_info 
group by course
order by count desc
limit 1;
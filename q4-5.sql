/*
Consider a table E(sid int, cid int)
Here SID is student and CID is the course student is taking.
for each student, list the student and the number of courses the student is taking.
*/
select sid,count(sid) from E group by sid;

/*
for each course, list the number of students taking that course.
*/
select cid,count(cid) from E group by cid;

/*
find the students who are taking the most number of classes.
*/
select sid, count(sid) from E
group by sid
order by count(sid) desc
limit 1;

/*
find the courses with most number of students.
*/
select cid, count(cid) from E
group by cid
order by count(cid) desc
limit 1;

/*Use E(SID,CID) for these challenges.

1. List all pairs of students who are taking at least one course together

2. List all pairs of students who are taking all courses together

3. List all pairs of students who are NOT taking any course together.

(think in terms of sets to solve these problems)
*/
select distinct A.SID, B.SID from E as A, E as B
where A.SID < B.SID
and A.CID = B.CID 
order by A.SID, B.SID;

select A1.SID, B1.SID 
from E as A1, E as B1 
where A1.SID < B1.SID;

select distinct A2.SID, B2.SID 
from E as A2, E as B2
where A2.SID < B2.SID
having (A2.SID, B2.SID) not in (
    select A3.SID, B3.SID 
		from E as A3, E as B3
    WHERE A3.SID < B3.SID AND A3.CID = B3.CID
		)
ORDER BY A2.SID, B2.SID;
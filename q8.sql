/*For this challenge use engagement-data.csv

Data in this file looks like this
<LECTURE><STUDENT NAME><POINTS SCORED in THAT LECTURE>

L02,Olga Shiligin ,8
L02,Sudhan Maharjan ,2

here in L02, Olga Shiligin,scored 8 points in L02.
And Sudhan Maharjan scored 2 points in L02.
*/

/* create table engage*/
DROP table IF EXISTS engage;
CREATE TABLE IF NOT EXISTS engage(
lecture VARCHAR(255) NOT NULL,
student VARCHAR(255) NOT NULL,
nopost INT NOT NULL
);
LOAD DATA LOCAL INFILE 'engagement-data.csv'
INTO TABLE engagementdata
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
SELECT * FROM engage;
 
/* find the lecture in which maximum number of students scored */
Select a.lecture from 
(select lecture, count(*) numstudents from engage group by lecture) as a
Join 
(Select max(b.numstudents) as maxstudents from
(Select lecture, count(*) as numstudents from engage group by lecture) as b) as c
On a.numstudents = c.maxstudents;
 
/* for each lecture, list the students from the reference set that did not score any points */
Select * from
(Select a.student as student, b.lecture as lecture from
((Select distinct student from engage) as a
Join (Select distinct lecture from engage) as b)) as allcombos
Natural left join
(Select student, lecture from engage) as currentcombos
Where currentcombos.student IS NULL;
 
/* for each lecture, list the student with the highest points scored */
Select a.lecture, a.student, a.nopost from engage as a
join
(Select lecture, max(nopost) as maxpoints from engage group by lecture) as b
On a.nopost = b.maxpoints and a.lecture = b.lecture;

/*Please take a look at the table below.

+-------+-----------+------+-------------+
| class | classFreq | N    | class_prior |
+-------+-----------+------+-------------+
| no    |         5 |   14 |      0.3571 |
| yes   |         9 |   14 |      0.6429 |
+-------+-----------+------+-------------+

p9) for both CS232 and CS435

From the data provided, generate this table.

Notice that
no occurs 5 times in class, and there are 14 records in total.
class_prior is 5/14.
*/

/* create table p8p10*/
DROP table IF EXISTS p8p10;
CREATE TABLE IF NOT EXISTS p8p10(
LS VARCHAR(255) NOT NULL,
W VARCHAR(255) NOT NULL,
ES VARCHAR(255) NOT NULL,
CR VARCHAR(255) NOT NULL,
TX VARCHAR(255) NOT NULL
);
LOAD DATA LOCAL INFILE 'p8p10.data'
INTO TABLE p8p10
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';
SELECT * FROM p8p10;
 
Select *, a.classFreq/b.N as class_prior from
(Select TX as class, count(TX) as classFreq  from p8p10 group by TX) as a
join
(Select count(*) as N from p8p10) as b;
/*
p(10)
CS435 (not suitable for all students in CS232 but those who like a
challenge
can fry your brains (or sharpen your tools))

DSC and ML algorithms attempt to determine the class given data.
Is this patient sick or is this patient pregnant?
Is this card transaction fradulent or legit?
Is this student merit admission or reject?
Is this credit card application creditworthy to be approved or decl
ined?

One approach is to compute probability of class given observation X
.
X is the feature vector.

For example,
LS,W,ES,CR,TX
youth,high,employed,fair,no
youth,high,employed,excellent,no
middle,high,employed,fair,yes
senior,medium,employed,fair,yes
senior,low,unemployed,fair,yes
senior,low,unemployed,excellent,no
middle,low,unemployed,excellent,yes
youth,medium,employed,fair,no
youth,low,unemployed,fair,yes
senior,medium,unemployed,fair,yes

There are five columns and 14 records excluding the header column.
There are 4 other columns and they are are called feature and a col
umn of vectors
is called a feature vector.
The fifth column, TX is the class column it is either yes or no.

Now then, a ML algo tries to predict TX given the other values, usi
ng
Bayes Formula.

Bayes Formula:

Class Conditional Probability= Likelihood * Class Prior / Marginal
Probability

P(class=C|X=(x1...xn))=P(X=(x1....xn)|class=C) * P(class=C)/ P(X)



In the first part you computed the P(class=C)
+-------+-----------+------+-------------+
| class | classFreq | N    | class_prior |
+-------+-----------+------+-------------+
| no    |         5 |   14 |      0.3571 |
| yes   |         9 |   14 |      0.6429 |
+-------+-----------+------+-------------+

Here P(class=no)=0.3571 and P(class=yes)=0.6429

You are being asked to compute P(X|C)P(C)

P(X|C) is computed as follows:
P(LS=youth|class=no) --
 (number of time LS is youth when class is no) / (number time of times class is no)
P(LS=middle|class=no)
 (number of time LS is middle when class is no) / (number time of times class is no)
P(LS=senior|class=no)
 (number of time LS is senior when class is no) / (number time of times class is no)

P(LS=youth|class=yes)
P(LS=middle|class=yes)
P(LS=senior|class=yes)

P(W=high|class=no)
P(W=medium|class=no)
P(W=medium|class=yes)

P(ES=employed|class=no)
P(ES=employed|class=yes)

P(CR=excellent|class=no)
P(CR=fair|class=yes)

Here is a partial table please use full table given above
given:
LS,W,ES,CR,TX
youth,high,employed,fair,no
youth,high,employed,excellent,no
middle,high,employed,fair,yes
senior,medium,employed,fair,yes
*/
 
/* p10 */
/* P(X|C) */
Select a.LS, a.class, a.classFreq, b.N, a.classFreq/b.N as PXC from
(Select LS, TX as class, count(TX) as classFreq  from p8p10 group by TX, LS) as a
join
(Select TX, count(*) as N from p8p10 group by TX) as b
On a.class = b.TX;
 
/* P(W|C) */
Select a.W, a.class, a.classFreq, b.N, a.classFreq/b.N as PWC from
(Select W, TX as class, count(TX) as classFreq  from p8p10 group by TX, W) as a
join
(Select TX, count(*) as N from p8p10 group by TX) as b
On a.class = b.TX;
 
/* P(ES|C) */
Select a.ES, a.class, a.classFreq, b.N, a.classFreq/b.N as PESC from
(Select ES, TX as class, count(TX) as classFreq  from p8p10 group by TX, ES) as a
join
(Select TX, count(*) as N from p8p10 group by TX) as b
On a.class = b.TX;
 
/* P(CR|C) */
Select a.CR, a.class, a.classFreq, b.N, a.classFreq/b.N as PCRC from
(Select CR, TX as class, count(TX) as classFreq  from p8p10 group by TX, CR) as a
join
(Select TX, count(*) as N from p8p10 group by TX) as b
On a.class = b.TX;
 
/*Load the data given to you in the form of insert statements in pq7.sql
You can change the table name from T to something else to store vector.
Every column in a table is a vector.

(1) Write a query to compute
(X-mu)/sd where X is the vector , mu is the mean(X) and sd is stddev(X)*/

drop table T;
create table T(t int);
insert into T values (58);
insert into T values (23);
insert into T values (34);
insert into T values (72);
insert into T values (82);
insert into T values (43);
insert into T values (97);
insert into T values (98);
insert into T values (85);
insert into T values (100);
insert into T values (87);
insert into T values (71);
insert into T values (40);
insert into T values (32);
insert into T values (85);
insert into T values (14);
insert into T values (52);
insert into T values (60);
insert into T values (95);
insert into T values (63);
insert into T values (59);
insert into T values (28);
insert into T values (15);
insert into T values (81);
insert into T values (39);
insert into T values (83);
insert into T values (69);
insert into T values (89);
insert into T values (12);
insert into T values (78);
insert into T values (63);
insert into T values (28);
insert into T values (31);
insert into T values (35);
insert into T values (33);
insert into T values (81);
insert into T values (28);
insert into T values (94);
insert into T values (91);
insert into T values (18);
insert into T values (80);
insert into T values (9);
insert into T values (29);
insert into T values (67);
insert into T values (79);
insert into T values (78);
insert into T values (13);
insert into T values (38);
insert into T values (30);
insert into T values (76);
insert into T values (50);
insert into T values (82);
insert into T values (31);
insert into T values (83);
insert into T values (90);
insert into T values (2);
insert into T values (26);
insert into T values (96);
insert into T values (57);
insert into T values (90);
insert into T values (30);
insert into T values (41);
insert into T values (54);
insert into T values (37);
insert into T values (13);
insert into T values (40);
insert into T values (11);
insert into T values (96);
insert into T values (42);
insert into T values (100);
insert into T values (58);
insert into T values (79);
insert into T values (91);
insert into T values (51);
insert into T values (9);
insert into T values (25);
insert into T values (81);
insert into T values (23);
insert into T values (60);
insert into T values (93);
insert into T values (86);
insert into T values (11);
insert into T values (91);
insert into T values (84);
insert into T values (83);
insert into T values (11);
insert into T values (17);
insert into T values (95);
insert into T values (12);
insert into T values (27);
insert into T values (6);
insert into T values (19);
insert into T values (54);
insert into T values (57);
insert into T values (50);
insert into T values (34);
insert into T values (70);
insert into T values (53);
insert into T values (41);
insert into T values (14);
insert into T values (90);
insert into T values (50);
insert into T values (41);
insert into T values (15);
insert into T values (3);
insert into T values (77);
insert into T values (76);
insert into T values (78);
insert into T values (89);
insert into T values (33);
insert into T values (20);
insert into T values (57);
insert into T values (29);
insert into T values (53);
insert into T values (61);
insert into T values (70);
insert into T values (84);
insert into T values (37);
insert into T values (83);
insert into T values (63);
insert into T values (35);
insert into T values (84);
insert into T values (50);
insert into T values (29);
insert into T values (36);
insert into T values (70);
insert into T values (52);
insert into T values (35);
insert into T values (97);
insert into T values (7);
insert into T values (14);
insert into T values (30);
insert into T values (17);
insert into T values (64);
insert into T values (10);
insert into T values (9);
insert into T values (78);
insert into T values (87);
insert into T values (12);
insert into T values (27);
insert into T values (77);
insert into T values (47);
insert into T values (34);
insert into T values (55);
insert into T values (45);
insert into T values (3);
insert into T values (85);
insert into T values (33);
insert into T values (51);
insert into T values (16);
insert into T values (67);
insert into T values (66);
insert into T values (91);
insert into T values (85);
insert into T values (1);
insert into T values (70);
insert into T values (9);
insert into T values (74);
insert into T values (32);
insert into T values (84);
insert into T values (51);
insert into T values (43);
insert into T values (74);
insert into T values (36);
insert into T values (98);
insert into T values (86);
insert into T values (68);
insert into T values (86);
insert into T values (71);
insert into T values (41);
insert into T values (3);
insert into T values (60);
insert into T values (30);
insert into T values (73);
insert into T values (29);
insert into T values (4);
insert into T values (71);
insert into T values (28);
insert into T values (45);
insert into T values (76);
insert into T values (94);
insert into T values (92);
insert into T values (88);
insert into T values (96);
insert into T values (74);
insert into T values (74);
insert into T values (49);
insert into T values (16);
insert into T values (34);
insert into T values (35);
insert into T values (39);
insert into T values (34);
insert into T values (91);
insert into T values (19);
insert into T values (86);
insert into T values (97);
insert into T values (78);
insert into T values (98);
insert into T values (72);
insert into T values (67);

select (t - (select AVG(t) from T))/(select STDDEV(t) from T) as cal from T;

/*
(2) create a second table with two columns X, std where
std = (X-mu)/sd
*/

create table table2 (X int, std float);
insert into table2(X, std)
select t, (t - (select avg(t) from T))/(select Stddev(t) from T) as std from T;
select * from table2;


/*
(3) create a third table with three columns, X, std as above, normalized
Here the third column normalized is set to (X-mn)/(mx-mn)

where mn is min(X) and mx is max(X)
*/

create table table3 (X int, std float, Norm float);
insert into table3 (X, std, Norm)
select t, (t - (select avg(t) from T)/(select stddev(t) from T)), 
(t - (select min(t) from T))/((select max(t) from T) - (select min(t) from T)) from T;
select * from table3;




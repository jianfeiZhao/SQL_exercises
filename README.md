# SQL_exercises
from q0 to q10

* [UPDATE Statement](https://github.com/jianfeiZhao/SQL_exercises#1-update-statement)
* [DELETE Statement](https://github.com/jianfeiZhao/SQL_exercises#2-delete-statement)
* [SELECT Structure](https://github.com/jianfeiZhao/SQL_exercises#3-basic-select-structure)
* [SQL Functions](https://github.com/jianfeiZhao/SQL_exercises#4-sql-functions)

## 1. UPDATE Statement
```
UPDATE emptest  
SET deptno=30  
WHERE empno=7369;

UPDATE emptest  
SET comm=nvl(comm,0)+100 , ename=INITCAP(ename);
```
## 2. DELETE Statement
```
DELETE FROM emptest  
WHERE deptno=30;
```
## 3. Basic SELECT structure 
```
SELECT     <>
FROM       <>
WHERE      <>
GROUP BY   <>
HAVING     <>
ORDER BY   <>
-- SELECT and FORM clause are mandatory, all other clauses are optional and to be used as required by query result

SELECT DISTINCT job,deptno  
FROM emp  
ORDER BY deptno, job;

SELECT ename, sal  
FROM emp  
ORDER BY 2 desc, 1;

SELECT ename, sal
FROM emp
WHERE sal BETWEEN 4500 AND 9000
ORDER BY sal;

SELECT ename, deptno
FROM emp
WHERE deptno IN (10,30)
ORDER BY 2;

SELECT ename, deptno
FROM emp
WHERE ename like '%A%'
ORDER BY 1;

SELECT ename, sal, comm
FROM emp
WHERE comm IS NULL;
```
## 4. SQL Functions
```
SELECT ename, lower(ename), initcap(ename), substr(ename,1,2), substr(ename,-3,2), substr(ename,-2)
FROM emp
WHERE UPPER(JOB)='CLERK';

SELECT ename, LENGTH(ename), sal, LPAD(sal,10,0)
FROM emp
WHERE UPPER(JOB)='CLERK';
```
### Number Functions
```
SELECT ROUND(45.926,2), ROUND(45.926) FROM dual;

SELECT TRUNC(45.926,2), TRUNC(45.926) FROM dual;

SELECT ename, sal, MOD(sal, 1000)
FROM emp;
```

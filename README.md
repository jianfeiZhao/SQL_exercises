# SQL_exercises
from q0 to q10

### 1. UPDATE Statement
```
UPDATE emptest  
SET deptno=30  
WHERE empno=7369;

UPDATE emptest  
SET comm=nvl(comm,0)+100 , ename=INITCAP(ename);
```
### 2. DELETE Statement
```
DELETE FROM emptest  
WHERE deptno=30;
```
### 3. Basic SELECT structure 
```
SELECT  <>
FROM   <>
WHERE  <>
GROUP BY  <>
HAVING  <>
ORDER BY  <>
-- SELECT and FORM clause are mandatory, all other clauses are optional and to be used as required by query result

SELECT DISTINCT job,deptno  
FROM emp  
ORDER BY deptno, job;

SELECT ename, sal  
FROM emp  
ORDER BY 2 desc, 1;
```

# SQL_exercises
from q0 to q10

### 1. UPDATE Statement
UPDATE emptest  
SET deptno=30  
WHERE empno=7369;

UPDATE emptest  
SET comm=nvl(comm,0)+100 , ename=INITCAP(ename);

### 2. DELETE Statement
DELETE FROM emptest  
WHERE deptno=30;

### 3. Basic SELECT structure 
SELECT --------<column list, expressions, literals>   
FROM ----------<table list>  
WHERE ---------<filter conditions with AND/OR/NOT logical operators> 
GROUP BY ------<column list for aggregate functions COUNT/SUM/MIN/MAX/AVG etc.>  
HAVING --------<filter conditions for grouping results>  
ORDER BY ------<column list for sorting result set>  
(SELECT and FORM clause are mandatory, all other clauses are optional and to be used as required by query result)  

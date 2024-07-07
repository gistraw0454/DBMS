--EMPLOYEES 테이블에서 HIREDATE가 2003~ 2005년 까지인 사원검색
--HIREDATE, FIRST_NAME, DEPARTMENT_NAME
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;	--DEPARTMENT PK FK -> 등가조인

SELECT HIRE_DATE,FIRST_NAME,DEPARTMENT_NAME  FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID AND 
HIRE_DATE BETWEEN TO_DATE('2003-01','YYYY-MM') AND TO_DATE('2006-01','YYYY-MM');

--NATURAL JOIN
SELECT * FROM EMP TNNER JOIN DEPT
ON EMP.DEPTNO =DEPT.DEPTNO ;

SELECT * FROM EMP E NATURAL JOIN DEPT D;
-- ==
SELECT * FROM EMP TNNER JOIN DEPT
USING(DEPTNO);

--LEFT OUTER JOIN
SELECT * FROM STADIUM;
SELECT * FROM TEAM;

SELECT * FROM STADIUM JOIN TEAM 
ON HOMETEAM_ID = TEAM_ID;	--팀이 있는것만 나옴 NULL은 안나옴

--LEFT OUTER JOIN
SELECT * FROM STADIUM LEFT OUTER JOIN TEAM 
ON HOMETEAM_ID = TEAM_ID;	-- 왼쪽 정보 STADIUM는 싹다 가져오고 나머지는 TEAM에있는거 기준으로 나옴

--RIGHT OUTER JOIN
SELECT * FROM STADIUM RIGHT OUTER JOIN TEAM 
ON HOMETEAM_ID = TEAM_ID;

--FULL OUTER JOIN
SELECT * FROM STADIUM FULL OUTER JOIN TEAM 
ON HOMETEAM_ID = TEAM_ID;

--SELF JOIN
SELECT * FROM EMP;
SELECT E1.ENAME 사원, E2.ENAME 매니저 FROM EMP E1 JOIN EMP E2 
ON E1.MGR = E2.EMPNO;	--E1에있는 매니저번호로 E2에서 찾아서 나열





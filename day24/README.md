# Day 24 네츄럴조인, 외부조인, 셸프조인

복습..
```SQL
--EMPLOYEES 테이블에서 HIREDATE가 2003~ 2005년 까지인 사원검색
--HIREDATE, FIRST_NAME, DEPARTMENT_NAME
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;	--DEPARTMENT PK FK -> 등가조인

SELECT HIRE_DATE,FIRST_NAME,DEPARTMENT_NAME  FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID AND 
HIRE_DATE BETWEEN TO_DATE('2003-01','YYYY-MM') AND TO_DATE('2006-01','YYYY-MM');
```
> TO_DATE('2003-01','YYY-MM') AND TO_DATE('2005-12','YYYY-MM')을 하면, 2005-12-01~ 2005-12-31 까지 전부 포함하지 않는다.

## 네츄럴 조인 NATURAL JOIN
- `USING` 
    - 중복되는 컬럼이 생길시 맨 앞으로 출력하며 중복컬럼을 한개만 출력
    - 컬럼 이름뿐만 아니라 타입까지 모두 같아야한다.

    ```SQL
    SELECT * FROM EMP E NATURAL JOIN DEPT D;

    SELECT * FROM EMP TNNER JOIN DEPT
    USING(DEPTNO);
    ```
## 외부조인 OUTER JOIN
- 두개의 테이블중 조건이 거짓이라도 지정한 테이블의 모든 정보가 검색되어야할 때 사용
    >내부조인은 있는것 중에 조건에 맞는 것만 나옴. 외부조인은 조건에 맞지않는 것도 보고 싶을 때 사용
    - LEFT OUTER JOIN : 기준으로부터 왼쪽에 작성한 테이블이 다 나옴
    - RIGHT OUTER JOIN : 오른쪽이 나옴
    - FULL OUTER JOIN : 양쪽 다나옴

    ```SQL
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
    ```


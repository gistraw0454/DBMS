# Day 23 JOIN

## JOIN
- 여러 테이블에 흩어져있는 정보중 사용자가 필요한 정보만 가져와서 가상의 테이블처럼 만들고 결과를 보여주는 것
- 조회 테이블이 너무 많이 쪼개져있으면 느려지기때문에 입력,수정,삭제의 성능을 향상 시키기위해서 사용한다.

### 내부조인(INNER JOIN) 
- INNER 생략 가능
- 조건이 일치하는 값이 두 테이블에 모두 존재 할 때 조회
- `테이블명A INNER JOIN 테이블명B` ON 조건식
- `테이블명A JOIN 테이블명B` ON 조건식
- 등가조인 : ON절에 등호가 있을 때
- 비등가조인 : ON절에 등호가 없을 때

ON절의 조건은 JOIN이 되면서 실행된다. (이게 더 효율적)

WHERE 절의 조건은 JOIN이 모두 끝나고 나서 실행된다.

```sql
--EMP 테이블에서 사원번호로 DEPT 테이블의 지역 검색하기
SELECT * FROM EMP;	--DEPTNO FK
SELECT * FROM DEPT; --DEPTNO PK

SELECT EMP.DEPTNO, EMP.ENAME, EMP.JOB, DEPT.LOC FROM EMP JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO; -- 겹치는 테이블은 소속을 써주자 !

--PLAYER TABLE에서 송종국 선수가 속한 팀의 전화번호 검색
SELECT * FROM PLAYER;
SELECT * FROM TEAM;

SELECT P.TEAM_ID, P.PLAYER_NAME , T.TEL FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID AND P.PLAYER_NAME = '송종국';

--JOBS TABLE에서 JOB_ID 로 EMPLOYEES의 EMAIL,JOB_TITLE, 성, 이름 검색
SELECT * FROM JOBS;
SELECT * FROM EMPLOYEES;

SELECT J.JOB_ID , J.JOB_TITLE , E.EMAIL ,E.LAST_NAME ||' '||E.FIRST_NAME 이름 FROM JOBS J JOIN EMPLOYEES E
ON J.JOB_ID = E.JOB_ID ;


SELECT * FROM DEPT;

--급여로 등급 나누기
SELECT * FROM SALGRADE;
SELECT * FROM EMP;

SELECT E.EMPNO, E.ENAME ,S.GRADE,E.SAL FROM SALGRADE S JOIN EMP E
ON E.SAL BETWEEN S.LOSAL AND S.HISAL ; --등호가 없으니 비등가조인

-- 하나를 더 조인하고싶으면?
-- CARDINALITY, COST 둘다 아래와동일
SELECT E.EMPNO, E.ENAME ,S.GRADE,E.SAL FROM SALGRADE S JOIN EMP E
ON E.SAL BETWEEN S.LOSAL AND S.HISAL 
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

-- CARDINALITY, COST 둘다 위와동일
SELECT E.EMPNO, D.DNAME, E.ENAME, S.GRADE, E.SAL FROM
SALGRADE S, EMP E, DEPT D
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND E.DEPTNO = D.DEPTNO;
    
```
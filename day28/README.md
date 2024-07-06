# Day 28 테이블복사, VIEW 생성
`CREATE TABLE [새테이블] AS (SELECT * FROM [계정].[가져올테이블])`

AS로 복사해온다.

```SQL
-- SCOTT 계정의 EMP 테이블을 복사해서 비등가 조인으로 등급별 ENAME, SAL검색하기

CREATE TABLE EMP AS SELECT * FROM SCOTT.EMP;

SELECT * FROM EMP;

SELECT S."LEVEL",E.ENAME, E.SAL FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY 1;


--HR 계정의 DEPT테이블을 복사, 복사 테이블에서 LOC별(GROUP별 !) 평균 급여 검색 (단, LOC은 모두 검색)
CREATE TABLE COPY_DEPT AS SELECT * FROM HR.DEPT;
CREATE TABLE COPY_EMP AS SELECT * FROM HR.EMP;

SELECT LOC 지역, NVL(AVG(E.SAL),0)평균급여 FROM COPY_DEPT D LEFT OUTER JOIN COPY_EMP E
ON D.DEPTNO = E.DEPTNO
GROUP BY LOC;

SELECT * FROM COPY_DEPT;
```

## VIEW **
- 기존의 테이블은 그대로 놔둔채, 필요한 컬럼들 및 새로운 컬럼을 만든 가상 테이블
- 실제 데이터가 저장되는 것은 아니지만 VIEW를 통해 데이터를 관리 할 수 있다.
- 가상의 테이블을 만들어주는 것. (A 열만 보안상 제외한 상태로 VIEW로 만들어 다른개발자들이 못보게 만듦)
- 독립성 : 다론곳에서 변경하지 못하도록
- 편리성 : 긴 쿼리문을 짧게
- 보안성 : 짧게 만들기 때문에 기존의 쿼리는 보이지 않는다.

```SQL

--VIEW 
-- grant create view to flower; 로 권한 줘야함
CREATE VIEW PLAYER_AGE 
AS (SELECT ROUND((SYSDATE - BIRTH_DATE) / 365) AGE, P.* FROM COPY_PLAYER P)

SELECT * FROM PLAYER_AGE;

DROP VIEW PLAYER_AGE;

-- 30살이 넘은 선수들 검색
SELECT * FROM PLAYER_AGE WHERE AGE >30;
```

-- EMPLOYEES 테이블에서 사원이름과 그 사원의 매니저 이름이 있는 VIEW를 만들기
SELECT * FROM HR.EMPLOYEES;	--grant select on employees to flower;
CREATE VIEW EMPLOYEES_MANAGER
AS (
SELECT E1.LAST_NAME||' '||E1.FIRST_NAME AS ENAME, E2.LAST_NAME||' '||E2.FIRST_NAME AS MNAME FROM HR.EMPLOYEES E1 JOIN HR.EMPLOYEES E2
ON E1.MANAGER_ID = E2.EMPLOYEE_ID
);
SELECT * FROM EMPLOYEES_MANAGER ;
DROP VIEW EMPLOYEES_MANAGER;

--KING STEAVEN의 사원 목록 조회
SELECT MNAME, ENAME FROM EMPLOYEES_MANAGER
WHERE MNAME = 'King Steven';

SELECT COUNT(ENAME) FROM EMPLOYEES_MANAGER
WHERE MNAME = 'King Steven';


-- PLAYER TABLE에 TEAM_NAME COLUMN을 추가한 VIEW만들기
SELECT * FROM HR.TEAM;

CREATE VIEW PLAYER_TEAM_NAME
AS(
SELECT T.TEAM_NAME,P.* FROM COPY_PLAYER P JOIN HR.TEAM T
ON P.TEAM_ID = T.TEAM_ID
);

SELECT * FROM PLAYER_TEAM_NAME ;

SELECT * FROM PLAYER_TEAM_NAME WHERE TEAM_NAME = '울산현대';


-- HOMETEAM_ID, STADIUM_NAME, TEAM_NAME 검섹
-- HOMETEAM이 없는 경기장 이름도 검색하고 VIEW로 만들기
-- 이 VIEW에서 TEAM_NAME이 NULL인 경기장 검색하기
-- GRANT SELECT ON STADIUM TO FLOWER;
CREATE VIEW STADIUM_INFO
AS (
	SELECT S.HOMETEAM_ID, S.STADIUM_NAME, T.TEAM_NAME 
	FROM HR.TEAM T RIGHT OUTER JOIN HR.STADIUM S
	ON T.TEAM_ID = S.HOMETEAM_ID
);
SELECT * FROM STADIUM_INFO
WHERE TEAM_NAME IS NULL;


--EMPLOYEES TABLE에서 사원들의FIRST_NAME 모두 검색
-- 사원들중에서 매니저들은 그 JOB_ID 검색
-- VIEW로 만들고 매니저가 아니면서 FIRST_NAME 이 A로 시작하는 사원 검색
-- 즉, 모든 사원이 다 나오는데 그중 매니저만 JOB_ID가 붙어 나오게 한다.

CREATE VIEW MANAGER_INFO 
AS (
SELECT E2.JOB_ID, E1.FIRST_NAME
FROM HR.EMPLOYEES E1 LEFT OUTER JOIN (
	SELECT JOB_ID, MANAGER_ID FROM HR.EMPLOYEES
) E2
ON E1.EMPLOYEE_ID = E2.MANAGER_ID
);
SELECT JOB_ID, MANAGER_ID FROM HR.EMPLOYEES;
SELECT * FROM MANAGER_INFO; -- JOB_ID가 없는건 일반사원이다.

--매니저
SELECT * FROM MANAGER_INFO WHERE JOB_ID IS NOT NULL
ORDER BY 2;

SELECT FIRST_NAME FROM MANAGER_INFO
WHERE JOB_ID IS NOT NULL
GROUP BY FIRST_NAME;	--18개 맞네.

SELECT MANAGER_ID FROM HR.EMPLOYEES
GROUP BY MANAGER_ID;	--총 18개가 맞네.


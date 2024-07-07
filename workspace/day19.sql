SELECT * FROM TBL_CAR;

ALTER TABLE TBL_CAR MODIFY BRAND NOT NULL;

INSERT INTO TBL_CAR
VALUES(001,'벤츠','회색',35000);

INSERT INTO TBL_CAR
VALUES(003,'아우디',NULL,35000);

--PLAYER TABLE에서 POSITION이 NULL인 선수검색
SELECT * FROM PLAYER WHERE "POSITION" IS NULL;

--PLAYER TABLE에서 POSITION이 NULL이면 '미정'으로 결과 출력하기
SELECT NVL("POSITION",'미정') FROM PLAYER WHERE "POSITION" IS NULL; 
SELECT PLAYER_NAME "선수 이름", NVL("POSITION",'미정') 포지션 FROM PLAYER;

SELECT PLAYER_NAME "선수 이름",NVL2("POSITION",'확정','미정') AS 포지션 FROM PLAYER;

-- PLAYER 테이블에서 NATION 이 NULL 이면 미등록,아니면 등록으로 변경
SELECT PLAYER_NAME "선수이름", NVL2(NATION,'등록','미등록') "국가 등록 여부" FROM PLAYER;

--숫자형 함수 (항상 DUAL 이라는 테이블에서 가져온다)
--절댓값
SELECT ABS(-10) FROM DUAL;

--양의정수(1), 영(0), 음의정수(-1) 판단
SELECT SIGN(-234),SIGN(0),SIGN(123) FROM DUAL;

--나머지 (%모듈러스)
SELECT MOD(10,3) FROM DUAL;

--값보다 큰 최근접 정수 (올림)
SELECT CEIL(3.14),CEIL(-3.14) FROM DUAL;

--값보다 작은 최근접 정수
SELECT  FLOOR(3.14),FLOOR(-3.14) FROM DUAL;

-- 반올림
SELECT ROUND(3.57352) FROM DUAL;
SELECT ROUND(3.57352, 1) FROM DUAL; -- 소수 첫째짜리 까지 반올림

-- 버림
SELECT TRUNC(3.9) FROM DUAL;

-- 키는 소숫점 둘째자리까지 반올림, 몸무게는 소수점 버림
SELECT ROUND(HEIGHT,2)||'CM' AS 키, TRUNC(WEIGHT)||'KG' AS 몸무게 FROM PLAYER;
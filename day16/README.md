# Day 16 - CONCATENATION, LIKE

## AS (aslias)
```sql
ex)
    SELECT * FROM STADIUM;
    SELECT * FROM TEAM;

    SELECT T.TEAM_ID AS "팀 아이디", S.ADDRESS AS "주소", T.TEL FROM STADIUM S, TEAM T;
```

## CONCATENATION (연결) : `||`

```
ex)
    SELECT E_PLAYER_NAME||'의 포지션은 '||"POSITION"||'이다.' 작전회의 FROM PLAYER;
```
![alt text](image.png)


## LIKE : 포함된 문자열의 값을 찾음, 문자의 개수도 제한을 줄 수 있음.
검색창 구현할 때 용이
- % : 모든것
- '%A' : A로 끝나는 모든값(SSSFSA,SDJSA)
- '_A' : A로 끝나면서 두자리인 값(AA, 2A,PA)


## NOT
ex)

SELECT * FROM PLAYER WHERE PLAYER_NAME `NOT` LIKE '이%';

SELECT * FROM PLAYER WHERE `NOT` PLAYER_NAME LIKE '이%'; <- 표준


```sql
    SELECT * FROM STADIUM;
    SELECT * FROM TEAM;

    SELECT T.TEAM_ID AS "팀 아이디", S.ADDRESS AS "주소", T.TEL FROM STADIUM S, TEAM T;

    --연결

    --누구누구의 별명은 뭐뭐다.
    SELECT PLAYER_NAME||'의 별명은'|| NICKNAME||' 이다.' FROM PLAYER;

    SELECT * FROM PLAYER;

    --누구누구의 포지션은 머머이다.
    SELECT E_PLAYER_NAME||'의 포지션은 '||"POSITION"||'이다.' 작전회의 FROM PLAYER;

    --LIKE
    SELECT * FROM TEAM WHERE TEAM_NAME LIKE '%마';
    SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE '김%';
    SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE '김_';

    --PLAYER TABLE 에서 이씨 찾기
    SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE '이%';

    --PLAYER TABLE 에서 김씨와 이씨 찾기
    SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE '김%' OR PLAYER_NAME LIKE '이%';

    --PLAYER TABLE 에서 이씨가 아닌 사람 찾기
    --NOT!
    SELECT * FROM PLAYER WHERE PLAYER_NAME NOT LIKE '이%';
    SELECT * FROM PLAYER WHERE NOT PLAYER_NAME LIKE '이%'; -- 표준

    --PLAYER TABLE에서 세자리 김씨가 아닌 사람 찾기
    SELECT * FROM PLAYER WHERE NOT PLAYER_NAME='김__';
```

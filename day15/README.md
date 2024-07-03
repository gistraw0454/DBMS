# Day 15 - TCL, AS

## TCL (Transaction Control Language)
DML을 위한 명령어

**transaction** : 하나의 작업 단위

- COMMIT : 모든 작업을 확정하는 명령어

- ROLLBACK : 이전 커밋한 지점으로 이동

TRUNCATE 는 테이블 내용을 전체 삭제 하므로, DELETE보다 빠르게 처리가능

대용량 데이터 처리에 유리하다. 하지만 복구가 불가능하기 떄문에 복구가 가능한 DELETE를 많이 쓴다.

![alt text](image.png)
![alt text](image-1.png)
해당 T가 Transaction을 의미

default 는 자동으로 commit 하도록 되어있음.

**롤백을 눌러 이전상태로 돌아갈수있다.**

## AS(ALIAS) : 별칭
- SELECT 절 : AS 뒤에 별칭 작성, 한 칸 띄우고 작성
- FROM 절 : 한 칸 띄우고 작성

```sql
    --PLAYER 테이블에서 TRAM_ID 가 'K01'인 선수 이름을 내이름으로 바꾸기
    UPDATE PLAYER 
    SET	PLAYER_NAME ='한동석'
    WHERE TEAM_ID = 'K01';

    SELECT * FROM PLAYER
    WHERE TEAM_ID ='K01';

    --PLAYER 테이블에서 POSITION이 MD인 선수 삭제하기
    DELETE FROM PLAYER WHERE POSITION ='MF';

    SELECT * FROM PLAYER
    WHERE "POSITION" ='MF';

    --AS (ALIAS)
    SELECT PLAYER_ID AS 선수번호 FROM PLAYER; --항상 ''은 값으로 인식하므로 빼주기, 띄어쓰기넣고싶으면 쌍따옴표 !
    SELECT PLAYER_ID AS "선수 번호" FROM PLAYER;
    SELECT PLAYER_ID "선수 번호" FROM PLAYER;
    SELECT PLAYER_ID "선수 번호",PLAYER_NAME "선수 이름" FROM PLAYER;

    --PLAYER 테이블에서 BACK_NUM "등 번호"로 , NICKNAME을 선수번호로 바꿔 검색
    SELECT BACK_NO AS "등 번호", NICKNAME AS "선수 별명"FROM PLAYER;

    SELECT PLAYER.TEAM_ID, TEAM.TEAM_ID FROM PLAYER, TEAM;

    SELECT P.TEAM_ID,T.TEAM_ID FROM PLAYER P, TEAM T;
    --실제로는 이딴식으로 쓰지 않는다. !!!!!!!!!!!!!!!!!!!
```
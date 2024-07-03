# Day 14 - DML2

## sql 파일들을 hr 계정에 추가하는 방법
cmd > `sqlplus hr/hr` > `@[파일경로]`

만약 한글이 깨진다면..?

- 파일 우클릭 > 편집 > 다른이름으로 저장 > 인코딩 ANSI > 덮어쓰기 

- 그래도 안되면 그냥 sql파일을 vs로 열고 그걸 복사해서 새 sql파일을 만들어보자.

> 연산자 우선순위 IN > AND > OR

```sql
    SELECT * FROM PLAYER;

    --PLAYER 테이블에서 TEMA_ID 가 'K01' 인 선수 검색
    SELECT * FROM PLAYER WHERE TEAM_ID='K01';

    --PLAYER 테이블에서 TEAM_ID 가 'K01' 이 아닌 선수 검색
    SELECT * FROM PLAYER WHERE TEAM_ID!='K01';

    --PLAYER 테이블에서 WEIGHT 가 70이상이고 80이하인 선수 검색
    SELECT * FROM PLAYER WHERE WEIGHT>=70 AND WEIGHT<=80;

    SELECT * FROM PLAYER WHERE WEIGHT BETWEEN 70 AND 80;

    --PLAYER 테이블에서 TEAM_ID 가 'K03' 이고 HEIGHT 가 180미만인 선수
    SELECT * FROM PLAYER WHERE TEAM_ID='K03' AND HEIGHT < 180;

    --PLAYER 테이블에서 TEAM_ID 가 'K06' 이고 NICKNAME이 '제리'인 선수 검색
    SELECT * FROM PLAYER WHERE TEAM_ID = 'K06' AND NICKNAME='제리';

    --PLAYER 테이블에서 HEIGHT 가 170이상이고 WEIGHT가 80이상인 선수
    SELECT * FROM PLAYER WHERE HEIGHT >=170 AND WEIGHT >=80;

    --STADIUM 테이블에서 SEAT_COUNT 가 3000초과이고 4100 이하인 경기장
    SELECT * FROM STADIUM WHERE SEAT_COUNT >3000 AND SEAT_COUNT <=4100;

    --PLAYER 테이블에서 TEAM_ID 가 'K02' 이거나 'K07' 이고 포지션은 'MF' 인 선수
    --항상 OR보다 AND 가 우선순위가 높다 , IN이 AND보다 우산순위가 높다.
    SELECT * FROM PLAYER WHERE (TEAM_ID = 'K02' OR TEAM_ID = 'K07') AND "POSITION" ='MF';
    
    SELECT * FROM PLAYER WHERE TEAM_ID IN ('K02','K07') AND "POSITION" = 'MF';
```

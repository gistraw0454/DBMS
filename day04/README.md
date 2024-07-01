# Day 04 IDE DBeaver와 Oracle DBMS 연동

## DBMS 소통방식
```
                 사용자
   ----------------------------------            
        ↕                   ↕                   
    고객관리        ↕       주문관리
    응용프로그램    ↕    응용프로그램
        ↕           ↕       ↕
   -----------------------------------    
                   DBMS
    (고객 아이디, 고객명, 연락처, 주소) 공유
    주문번호, 제품명, 수량
```

DBMS는 행렬로 저장 관리함.

Table A
번호    이름    나이
1       홍길동  20
2       이순신  22
3       이유진  21

이런식으로 이쁘게 만들어 놓은걸 스키마 라고하고 이걸 해당 담당계정이 관리함.

## DBeaver와 Oracle DBMS 연동
1. DBeaver 시작화면에서 Ctrl + Shift + N 을누르고 Oracle 을 찾아준다.
2. Driver Edit 부분에서 전부다 지우고, 새 파일을 추가해준다.
    "D:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib\ojdbc6.jar"
3. 연결 test를 해본 후 finish 를 누른다.

## Script 만들기
- 아래 scripts 를 열고 Ctrl+ ] 을 눌러 sql 스크립트 파일을 만들 수 있다.
- 간단하게 table 불러오는 방법
    ```sql
    SELECT * FROM EMPLOYEES;
    ```
    Ctrl + Enter -> 아래에 불러온 table 생성됨.


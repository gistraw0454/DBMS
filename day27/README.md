# Day 27 ROLE.AS

### 계정 권한 뺏기 (cmd)
```sql
revoke create user from scott; -- scott으로 부터 create user 권한 뺏기 
```
`conn scott/tiger` 에서 `create user flower identified by flower;`를 하면 권한이 없다 뜰 것이다.

### 계정 권한 주고, User 새로 만들기
`conn system/1234` 에서 `grant create user to scott;` 을 하면 다시 scott에게 create user 권한을 준다.

`conn scott/tiger` 에서 `create user flower idntified by flower;`를 하면 user가 만들어 질것이다.

### tablespace flower 만들기
`create tablespace flower datafile'D:\oraclexe\app\oracle\oradata\XE\FLOWER.DBF'SIZE 200M AUTOEXTEND ON NEXT 10M MAXSIZE 800M` 를 하면 tablespace를 만들 권한이 없다 뜬다.

`conn system/1234` 에서 만들어주면 된다.

## flower에 접근하기
conn flower/flower 하면 접근할 수 있는 권한이 없다 뜬다.

`conn system/1234`로 system으로 들어간 후 ,
```sql
grant connect to flower;    # connect(여러 묶음)에 들어있는 모든 권한들이 flower에 부여된다.
```
계정을 만든후 connect를 통해 role이란걸 권한 부여를 해주면 이런식으로 편하게 쓸 수 있다.

`conn flower/flower` 접속 성공함을 볼 수 있다.

## flower 을 tablespace에 연결하기
```sql
alter user flower default tablespace flower quota unlimited on flow
er;
```
flower에 alter 권한없다고 뜰 것이다. (connect에는 alter에 대한 권한은 없다.)

`conn system/1234` 로 들어가 `alter user flower default tablespace flower quota unlimited on flower;` 입력해주면 임시테이블스페이스가 만들어진다.

이제, flower까지도 바꿔주자. 

`alter user flower default tablespace flower;`

`alter user flower temporary tablespace temp;`

flower에 다른 권한도 줘보자. resource 뭉탱이 권한을 줘보겠다. `grant resource to flower;`

`conn flower/flower` 한 후 , `create table test002(id varchar2(50), pw varchar2(50), age number, constraint baby_pk primary key(id));` 를 쳐보면 직접 테이블을 만들 수 있음을 알 수 있다. (resource 권한으로 만들 수 있게됨.)

### connection을 새로 만들어주자
![alt text](image.png)
콘센트 처럼 생긴거 눌러서 아래쪽에 system부분을 flower로 바꾸고 비번으로 flower을 쳐준다. 

script도 localhost 3으로 맞춰준다.


## ROLE 
- 권한이 뭉쳐있는 (모여있는) 상태
- CONNECT, RESOURCE, DBA
- GRANT 권한명(ROLE이름),권한명2,... TO 계정명
- REVOKE 권한명(ROLE이름) FROM 계정명

A라는 게정의 테이블에 DML을 사용하기 위해서는 A계정에게 권한을 부여받아야한다.
- SYS 계정도 안됨. 무조건 "그계정" 이어야한다.

`grant select on player to flower;` 로 player로의 select 권한을 flower에게 준다.
`grant select on team to flower;` 로 team으로의 select 권한을 flower에게 준다.
```SQL
-- HR.PLAYER 의 모든걸 COPY_PLAYER로 COPY해오겠다. (HR로 부터 권한을 받아야함) 
CREATE TABLE COPY_PLAYER AS SELECT * FROM HR.PLAYER;

-- HR.TEAM에 대한 권한도 필요하다.
CREATE TABLE COPY_PLAYER AS SELECT * FROM HR.PLAYER;
SELECT * FROM COPY_PLAYER CP JOIN HR.TEAM T
ON CP.TEAM_ID = T.TEAM_ID;
```

### scott 테이블에서 SALGRADE를 복사한 후 GRADE 컬럼명을 LEVEL로 변경,값을 반대로 바꾸기 (5->1, 4->2,...,1->5)
`grant select on salgrade to flower;` 로 scott의 salgrade를 허용해준다.
```sql
CREATE TABLE SALGRADE AS SELECT * FROM SCOTT.SALGRADE;
ALTER TABLE SALGRADE RENAME COLUMN GRADE TO "LEVEL";
UPDATE SALGRADE
SET "LEVEL" = 6-"LEVEL";
SELECT * FROM SALGRADE;
```
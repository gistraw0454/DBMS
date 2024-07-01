# Day 02 오라클 DBMS 계정 설정

## 오라클 DBMS 버전
- i : internet 
- g : grid (데이터를 표로 만들어서 관리)
- c : cloud (대용량 데이터를 관리할 수 있게끔 구축 가능)

## 계정
- sys : 모든 권한
- system : 계정 관리
- 일반 계정 : 해당 `스키마` 관리 (hr, op, he, scott, ...)
    
    + `스키마` : 정리가 잘 되어있는 표들의 묶음, 상태


막혀있는 hr 계정 접근 방법 (CMD) 
```cmd
sqlplus sys as sysdba
1234
SQL>alter user system identified by 1234;   //system계정의 비번을 1234로 바꿔준다.
SQL>conn system/1234;   //connection 계정/비번 을 통해 system으로 들어감
SQL>alter user hr account unlock;   
SQL>alter user hr identified by hr; //hr계정의 비번을 hr로 바꿔준다.
SQL>conn hr/hr
```

**RDBMS**

관계형 데이터베이스 시스템, 테이블끼리 서로 관계를 맺는다.


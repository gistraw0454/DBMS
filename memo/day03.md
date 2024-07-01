# Day 03 통합개발 환경 IDE DBeaver 설치
- **IDE (통합개발 환경)** : 여러개의 dbms 문법을 쓸수있는 환경

## DBeaver IDE 설치
1. DBeaver IDE 설치 
- **install link**: [dbeaver 23.3.5 zip Downloads](https://dbeaver.io/files/23.3.5/)

2. jdk 1.8 설치
- **install link**: [Java SE Development Kit 1.8 Downloads](https://www.oracle.com/kr/java/technologies/javase/javase8-archive-downloads.html)

    jdk 가있어야 자바프로그램인 DBever가 돌아간다.

3. 시스템 환경 변수 설정
- 시스템 속성 > 환경 변수 > 시스템 > Path > `C:\Program Files\Java\jdk1.8.0_202\bin` 추가

## SQL (인터프리터 언어), 쿼리문
한 줄 씩 번역되고 빈번한 수정이 있을 때 효율적이다.

전체를 실행하지않고 부분만 실행하고 싶을 때에도 편리한 언어이다.

일괄 처리를 할 때에는 컴파일 언어보다 효율이 떨어진다.

## DBMS 소통방식
```
                 사용자
   ----------------------------------           응용프로그램은 종료를 누르면 사라진다. 
        ↕                   ↕                   그래서 사용자가 입력한 처리해야하는 데이터를 DBMS까지 보내야한다.
    고객관리        ↕       주문관리
    응용프로그램    ↕    응용프로그램
        ↕           ↕       ↕
   -----------------------------------    
                   DBMS
```





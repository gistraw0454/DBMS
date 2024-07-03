# Day 13 - DML1, 데이터 내보내기

VARCHAR로 보내기위해서는 ''로 값을 보내야한다.
""은 이미 사용중인 명령어를 컬럼명으로 쓸때 사용.

```sql
    SELECT * FROM PET;
    SELECT * FROM OWNER;

    -- 부모부터 넣을까? 자식부터 넣을까? -> OWNER부터 !
    INSERT INTO OWNER (ID, NAME, AGE, ADDRESS)
    VALUES('20201005001','한동석',20,'경기도 남양주시');	

    INSERT INTO OWNER (ID, NAME, AGE, ADDRESS)
    VALUES('20201005002','홍길동',21,'경기도 구리시');

    --제약조건을 확인해줘야한다. !
    INSERT INTO PET (PIN, NAME, AGE, OWNERID, GENDER)
    VALUES('8201001','뽀삐',4,'20201005001','W');

    INSERT INTO PET VALUES('8201002','바둑이',3,'20201005002','M');

    INSERT INTO PET VALUES('8201003','야옹이',10,'20201005001','M');

    SELECT * FROM PET WHERE GENDER != 'M';
    SELECT * FROM PET WHERE GENDER = 'M';

    --오류는 아니지만, 삭제된게 없다고 뜬다 ! OWNER중에 바둑이는없으니까
    DELETE FROM OWNER WHERE NAME ='바둑이';

    DELETE FROM PET WHERE NAME ='바둑이';

    UPDATE OWNER
    SET NAME ='이순신'
    WHERE ID = '20201005002'

    TRUNCATE TABLE PET;
```

## TABLE 내보내기
- 테이블 드래그 > 우클릭 > 데이터추출 > 선택하면됨!
- sql로 추출하고 cmd를 통해 insert를 해보자 !
    
    1. `sqlplus hr/hr`
    2. `@[sql경로]` (ex @E:\study_24_SUMMER\DBMS\PET_202407031554.sql)
    3. `commit;`

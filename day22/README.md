# Day 22 옵티마이저와 힌트

## OPTIMIZER
- COST : 예상 수행 시간, 쿼리를 수행하는데 소요되는 일량 또는 시간 (수치가 클수록 안좋다)
- CARDINALITY : 실행결과의 건수

- SQL을 가장 빠르고 효율적으로 수행할 최적의 처리경로(최저비용)를 생성해주는 DBMS 내부의 핵심엔진
- 사용자가 쿼리문(SQL) 으로 결과를 요청하면, 이를 생성하는데 필요한 처리경로는 DBMS에 내장된 옵티마이저가 자동으로 생성한다.

### OPTIMIZER 의 SQL 최적화 과정
- 사용자가 작성한 쿼리 수행을 위해, 실행될만한 실행계획을 찾는다
- 데이터 딕셔너리에 미리 수집해 놓은 오브젝트 통계 및 시스템 통계 정보를 이용해 각 실행 계획의 예상 비용을 산정한다.
- 각 실행계획을 비교해서 최저비용을 갖는 하나를 선택해 실행한다.

### OPTIMIZER 종류
1. 규칙기반 옵티마이저 (RBO), 휴리스틱(Heuristic) 옵티마이저
    - 미리 정해진 규칙에 따라 실행
    Oracle 10g 버전부터는 RBO 에 대한 지원 중단
2. 비용기반 옵티마이저 (CBO)
    - 비용이 가장 낮은 실행계획을 선택

```
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
PARSER          OPTIMIZER           ROW_SOURCE          SQL_ENGINE
                                    GENERATOR

문법오류검사,   총 비용 계산        실행가능 코드로 변경    실행
코드로 변경     실행계획 생성
```
A를 넣어도 B가 더 최적화된 경우, B가 실행될 수 도있다.

## SQL 실행순서
- FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY
    - orderby에서 느려짐..!

## 힌트 HINT : `/* + hint */`
- SELECT 문에 실행하고 싶은 계획을 전달할 때 사용하는 문법
- 잘못작성되어도 실행할 때에는 무시 -> 오류 x
- /*로 시작되며 */로 마친다. 뒤에 컬럼명을 사용할때 `,` 사용 x
- `SELECT /* + INDEX_DESC(테이블명 PK명)*/ 컬럼명1, 컬렴명2,... FROM 테이블명

```sql
SELECT * FROM PLAYER ORDER BY PLAYER_ID DESC;

-- PLAYER TABLE에서 INDEX_NAME으로 사용할 수 있는건 PLAYER_PK 다.
SELECT I.INDEX_NAME FROM USER_IND_COLUMNS I
WHERE TABLE_NAME = 'PLAYER';

SELECT /*+INDEX_DESC(PLAYER PLAYER_PK)*/ * FROM PLAYER;
SELECT /*+INDEX(PLAYER PLAYER_PK)*/ * FROM PLAYER;
```
전체게시글이나 전체댓글 이런걸 최신순 오래된순으로 가져오기 좋다.
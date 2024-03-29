-- DDL : create, alter, drop, TRUNCATE
-- (대상은 user, table, sequence, view, .. 단 truncate는 테이블만 사용)
-- DML : insert, update, delete, 

-- drop 오류 유형 - 외래키에 의해 참조되는 고유/ 기본 키가 테이블에 있을 경우

-- update 테이블명 set 컬럼명 = 캆, 컬럼명 = 값, 컬럼명 = 값,...
-- WHERE 조건컬럼 관계식
-- DELETE FROM 테이블명 WHERE 조건컬럼관게식
-- 주의 할 점 : UPDATE 와 delete 는 where 없이 사용하는 것은 위험한 동작.
--			TRUNCATE 는 실행 취소(rollback)할 수 없기 떄문에 DDL에 속합니다

UPDATE STUDENTS SET age = 17 WHERE stuno = 2021001;
-- UPDATE, delete, select 에서 where의 컬럼이 기본키 컬럼이면
--		실행되는 결과 반영되는 행은 몇개일까요? 최대 1개
--		기본키의 목적은 테이블의 여러행들을 구분(식별)
SELECT * FROM STUDENTS s ;

-- rollback , commit 테스트 (데이터베이스 메뉴에서 트랜잭션 모드를 manual로 변경합니다)
UPDATE STUDENTS SET ADDRESS = '성북구',age= 16 WHERE STUNO = 2021001;
ROLLBACK; -- 위의 UPDATE 실행을 취소
UPDATE STUDENTS SET ADDRESS = '성북구',age= 16 WHERE STUNO = 2021001;
COMMIT;
SELECT * FROM STUDENTS s ; -- '성북구', 16세로 반영됨
ROLLBACK;
SELECT * FROM STUDENTS s ; -- 이미 commit이 된 명령어는 ROLLBACK 못함
-----------------------------------------------요까이
-- 트랜잭션 관리명령 : rollback, commit

DELETE FROM SCORES;
ROLLBACK;
DELETE FROM SCORES WHERE stuno = 2019019;
ROLLBACK;
SELECT * FROM SCORES;

-- 이 편집기는 트랜잭션 수동 모드이고 같은 창에서는 select 결과 2019019가 없습니다
-- 다른 편집기는 다른 클라이언트이므로 이전 상태(최종 커밋한 상태)로 보여집니다.
ROLLBACK;

TRUNCATE TABLE SCORES ; -- 모든 데이터를 지웁니다 ROLLBACK 여부 확인?
						-- 답 : rollback 불가
--모든 데이터를 지울것이 확실하면 다른것들과 섞여서 롤백되지 않게 확실하게 TRUNCATE 해라
----------------------------------------------------------
SELECT * FROM STUDENTS s ;
/*
 * 
 * insert
 * delete
 * commit;	
 * update
 * delete;
 * rollback;
 * insert;
 * insert;
 * rollback;
 * insert;
 * update;
 * commit;
 */




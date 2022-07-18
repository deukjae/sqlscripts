-- 조인과 group by 를 포함해서 select 로 검색하는 문제를 10개 만들기
-- group by 결과로도 조인을 할 수 있습니다.

-- 주석으로 검색하는 내용 쓰고 SELECT 쿼리 작성하세요


SELECT MAX_SALARY 
	FROM EMPLOYEES e
	JOIN JOBS j 
	ON e.JOB_ID = j.JOB_ID 
	AND EMPLOYEE_ID = 166;


--그룹함수 조회할 때 group by를 써야 그룹바이에 쓴 컬럼을 select 로 조회할 수 있습니다.
-- 		그룹바이 컬럼 외에는 다른 컬럼 select 할 수 없습니다 ->join,서브쿼리
--1단계 : 사용할 그룹함수 실행하기
SELECT department_ID , avg(salary) FROM EMPLOYEES e GROUP BY DEPARTMENT_ID ;

--2단계 : 조인하기
SELECT * FROM DEPARTMENTS d JOIN
		(SELECT DEPARTMENT_ID,avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID = tavg.department_ID;
	
--3단계 : 컬럼 지정하기
SELECT d.DEPARTMENT_ID,d.DEPARTMENT_NAME,ROUND(tavg.cavg,1) FROM DEPARTMENTS d 
		JOIN
		(SELECT DEPARTMENT_ID, avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID  = tavg.DEPARTMENT_ID
		ORDER BY tavg.cavg DESC;

--4단계 : 정렬한 결과로 특정 위치 지정 : first n은 상위 n개를 조회
SELECT d.DEPARTMENT_ID,d.DEPARTMENT_NAME,ROUND(tavg.cavg,1) FROM DEPARTMENTS d 
		JOIN
		(SELECT DEPARTMENT_ID, avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID = tavg.DEPARTMENT_ID
		ORDER BY tavg.cavg DESC
		FETCH FIRST 1 ROWS ONLY;

--오라클의 rownum은 가상의 컬럼으로 조회된 결과에 순차적으로 오라클이 부여하는 값입니다.
--				가상 커럼 사용을 위해 join이 한번 더 필요합니다
SELECT rownum,tcnt.* FROM
(SELECT department_ID, count(*) cnt FROM EMPLOYEES e
		GROUP BY DEPARTMENT_ID ORDER BY cnt desc) tcnt
WHERE rownum < 5;

SELECT rownum,tcnt.* FROM
(SELECT department_ID, count(*) cnt FROM EMPLOYEES e
		GROUP BY DEPARTMENT_ID ORDER BY cnt desc) tcnt
WHERE rownum = 1;

-- rownum 사용할 때 결과 확인이 안되는 예시 : rownum 1부터 시작해서 찾아갈 수 있는 조건식만 가능
-- where rownum = 3;
-- where rownum > 5;
-- 그래서 한번더 rownum 을 포함한 조회 결과로 select를 합니다 이 때 rownum은 별칭 부여
SELECT * FROM
(SELECT  rownum rn,tcnt.* FROM
(SELECT department_ID, count(*) cnt FROM EMPLOYEES e
		GROUP BY DEPARTMENT_ID ORDER BY cnt desc) tcnt)
WHERE rn BETWEEN 5 AND 9;
-- WHERE rn = 3;






SELECT count(*) FROM EMPLOYEES e ;		--테이블 전체 데이터 갯수 : 107
SELECT max(salary) FROM EMPLOYEES e ;	-- salary 컬럼의 최대값 : 24000
SELECT min(salary) FROM EMPLOYEES e ;   --             최소값 : 2100
SELECT AVG(salary) FROM EMPLOYEES e ;   --             평균값 : 6461.83....
SELECT sum(salary) FROM EMPLOYEES e ; 
/*
 * [[[[ '도서 대여' 처리 사항! ]]]]
 * 회원은 총 1권의 책만 대여중일 수 있다
 * 대여한다 : rent_date 는 대여일자, exp_date 는 반납기한일자이며 rent_date +14
 * 반납한다 : return date 는 반납일자, dalay_days는 연체 일수 return date - exp_date
 * 대출 중인 것 확인하는 처리조건 : return_date 가 null 이면 대여중 , null이 아니면 반납된 도서
 */
--1) 도서를 추가합니다. ‘B1102’ , ‘스트라이크 던지기’, ‘박철순’ ,’KBO’ , ‘2020-11-10’’
INSERT INTO tbl_book (bcode,title,WRITER,PUBLISHER,PDATE)
VALUES('B1102','스트라이크 던지기','박철순','KBO','2022-11-10');

--2) 반납된 도서의 연체일수를 계산하여 delay_days 컬럼값을 update 합니다.
UPDATE TBL_BOOKRENT SET DELAY_DAYS  = RETURN_DATE  - EXP_DATE
WHERE RETURN_DATE  IS NOT NULL;
SELECT * FROM TBL_BOOKRENT tb ;

--3) 대출 중인 도서의 연체일수 계산해서 회원 IDX, 도서코드, 연체일수 조회하기
--오늘 날짜 sysdate 는 년월일 패턴이 지정되지 않아 그냥하면 long 값으로 계산됩니다
SELECT  mem_idx, bcode, to_date(to_char(SYSDATE,'yyyy-MM-dd')) - exp_date 
FROM TBL_BOOKRENT tb  WHERE RETURN_DATE IS NULL;
--또는
SELECT  mem_idx, bcode, trunc(SYSDATE) - EXP_DATE  
FROM TBL_BOOKRENT tb  WHERE RETURN_DATE IS NULL;

--4) 현재 대출중인 도서 중 연체인 회원의 이름,전화번호를 검색합니다. 오늘 날짜 sysdate 기준으로 확인하기
-- 현재 기준으로 연체 중인것은 반납기한 < 현재날짜 
SELECT NAME,tel FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEM_IDX = tb.MEM_IDX AND SYSDATE > exp_date AND return_date IS NULL;

--5) 현재 대출중인 도서의 도서명코드와 도서명 검색합니다.
SELECT tb.BCODE ,TITLE  FROM TBL_BOOK tb  JOIN TBL_BOOKRENT tb2
ON tb.BCODE =tb2.BCODE  AND return_date IS NULL;

--6) 현재 도서를 대여한 회원의 IDX와 회원이름을 검색합니다
SELECT bm.MEM_IDX , NAME FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEM_IDX =tb.MEM_IDX AND return_date IS NULL;

--7) 대출중인 도서의 회원이름,도서명,반납기한 검색합니다
SELECT bm.name, tb.title, tb2.exp_date
FROM BOOK_MEMBER bm ,TBL_BOOK tb , TBL_BOOKRENT tb2 
WHERE bm.MEM_IDX = tb2.MEM_IDX AND tb.BCODE = tb2.BCODE 
AND tb2.RETURN_DATE IS NULL;

--또는
SELECT name, title, exp_date FROM TBL_BOOKRENT tb 
JOIN TBL_BOOK tb2 ON tb2.BCODE = tb.BCODE 
JOIN BOOK_MEMBER bm ON tb.MEM_IDX =bm.MEM_IDX 
WHERE RETURN_DATE IS NULL;

--8) 현재 연체 중인 도서의 회원IDX, 도서코드, 반납기한을 검색합니다.
SELECT mem_idx, bcode, exp_date FROM TBL_BOOKRENT tb 
WHERE SYSDATE > EXP_DATE ;

--9) 회원  IDX ‘10002’는 도서 대출이 가능한지 프로시저를 작성합니다.
DECLARE 
	vcnt NUMBER;
BEGIN 	
SELECT COUNT(*) 
INTO vcnt 			--SELECT 조회 결과 저장할 변수. 여러개 , 로 나열할 수 있음.
FROM TBL_BOOKRENT tb
WHERE MEM_IDX = 10001 AND RETURN_DATE IS NULL;  -- rent가 0일때만 대여가능
if(vcnt = 0) THEN
	DBMS_OUTPUT.put_line('책 대여 가능합니다.');
ELSE
	DBMS_OUTPUT.put_line('대여 중인 책을 반납해야 가능합니다.');
END IF;
END;


CREATE OR REPLACE PROCEDURE check_member(
	arg_mem IN book_member.MEM_IDX%TYPE,			--프로시저 실행할 때 값을 받을 매개변수
	isOK OUT varchar2							--자바의 리턴값 해당하는 부분.
)
IS 
		vcnt NUMBER;
		vname varchar2(100);
	BEGIN 	
		-- 입력매개변수가 없는 회원인가를 확인하는 sql과 exception 퍼리.
		-- arg_mem으로 회원테이블에서 name 조회 없으면 exception
		SELECT name INTO vname
			FROM BOOK_MEMBER bm WHERE MEM_IDX =arg_mem;
		
		SELECT COUNT(*) 
		INTO vcnt 
		FROM TBL_BOOKRENT tb
		WHERE MEM_IDX = arg_mem AND RETURN_DATE IS NULL;  -- rent가 0일때만 대여가능
		if(vcnt = 0) THEN
			DBMS_OUTPUT.put_line('책 대여 가능합니다.');
			isOK := '가능';
		ELSE
			DBMS_OUTPUT.put_line('대여 중인 책을 반납해야 가능합니다.');
			isOK := '불가능';
		END IF;
	EXCEPTION 	
		WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('찾는 ID가 없습니다.');
		isOK :='no match';
END;

-- 프로시저 실행하기
DECLARE 
	vresult varchar2(20);
BEGIN
	CHECK_member(10004,vresult);
	DBMS_OUTPUT.put_line('결과 : ' || vresult);
END;


--10) 도서명에 ‘패스트’ 라는 도서가 대출이 가능한지 프로시저를 작성합니다.
DECLARE
	v_bcode varchar2(100);
	v_cnt NUMBER;
BEGIN
	SELECT bcode INTO v_bcode		--v_bcode는 'A1102'
		FROM TBL_BOOK tb WHERE title = '페스트';
	SELECT count(*) INTO v_cnt			--v_cnt값이 1이면 v_bcode 책은 대출중
		FROM TBL_BOOKRENT tb2 WHERE BCODE = v_bcode AND return_date IS NULL;
if(v_cnt = 1 ) THEN
	DBMS_OUTPUT.put_line('대여 중인 책을 반납해야 가능합니다.');
ELSE
	DBMS_OUTPUT.put_line('책 대여 가능합니다.');
END IF;
END;


-- check_book 프로시저

CREATE OR REPLACE PROCEDURE CHECK_BOOK(
			arg_book IN tbl_book.title%TYPE,	-- 프로시저 실행할때 값을 받을 매개변수
			isOK OUT varchar2		-- 자바의 리턴값에 해당하는 부분.
	)
	IS 
	v_bcode varchar2(100);
 	v_cnt NUMBER;
 BEGIN
 	SELECT bcode INTO v_bcode		-- v_bcode는 'A1102'
 		FROM TBL_BOOK tb WHERE title = arg_book;
	-- 없는 책이름 입력하면 오류. bcode 값이 검색이 안됩니다.-> Exception 
 	SELECT count(*) INTO v_cnt		-- v_cnt 값이 1이면 v_bcode 책은 대출중
		FROM TBL_BOOKRENT tb2 WHERE BCODE = v_bcode AND return_date IS NULL; 
	 IF (v_cnt = 1) THEN 
		DBMS_OUTPUT.put_line('대여 중인 책 입니다.');
		isOK := 'FALSE' ;
  	 ELSE 
		DBMS_OUTPUT.put_line('책 대여 가능합니다.');
		isOK := 'TRUE' ;
  	 END IF;
  	
  	-- 없는 책은 isOK :='no match';
  	EXCEPTION		-- 예외(오류)처리
	WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('찾는 책이 없습니다.');
		isOK :='no match';

END;


DECLARE
	vresult varchar2(100);
BEGIN
	check_book('페스트',vresult);
	DBMS_OUTPUT.put_line('결과 : ' || vresult);
END;























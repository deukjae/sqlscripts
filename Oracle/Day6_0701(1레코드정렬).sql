-- SELECT 기본형식
-- SELECT 컬럼1,컬럼2,... from 테이블명 WHERE 검색조건식 order by 기준컬럼 desc/asc
--					order by 기분컬럼(오름 : asc, 내림 : desc)

SELECT * FROM TBL_BUY tb ;
SELECT * FROM TBL_CUSTOM tc ;
SELECT * FROM TBL_CUSTOM tc ORDER BY CUSTOM_ID ;
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID = 'mina012';
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID = 'mina012'
							ORDER BY BUY_DATE DESC; -- WHERE , ORDER BY 순서 지킵니다.
							

-- 조회할 컬럼 지정할 때 DISTINCT 키워드 : 중복값은 1번만 결과 출력
SELECT custom_id FROM TBL_BUY tb ; --구매고객 ID조회
SELECT DISTINCT custom_id FROM TBL_BUY tb ; -- 중복값은 1번만

-- 6/30 복습 문제
--1. age 가 30세 이상 고객의 모든 컬럼 조회
SELECT * FROM TBL_CUSTOM tc WHERE age >= 30;
--2. custom_id 'twice' 의 email 조회
SELECT email FROM TBL_CUSTOM WHERE CUSTOM_ID ='twice';
--3. category 'A2' 의 pname 조회
SELECT pname FROM TBL_PRODUCT tp WHERE CATEGORY ='A2';
--4. 상품 price의 최고값 조회
SELECT max(price) FROM TBL_PRODUCT price;
--5. 'IPAD001' 총구매 수량 조회
SELECT sum(quantity) FROM TBL_BUY quantity WHERE pcode = 'IPAD011';
--6. custom_id 'mina012'이 구매한 내용 조회
SELECT pcode FROM TBL_BUY WHERE CUSTOM_ID = 'mina012';
--7. 구매 상품 중 pcode가 '0'이 포함된 것 조회
SELECT * FROM TBL_BUY tb WHERE PCODE LIKE ('%0%');
--8. 구매 상품 중 pcode에 'on'을 포함하는 것 조회(대소문자 구분없는 조회)
SELECT * FROM TBL_BUY tb WHERE PCODE LIKE UPPER('%on%'); 
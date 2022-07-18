/*
 * [[[[ '���� �뿩' ó�� ����! ]]]]
 * ȸ���� �� 1���� å�� �뿩���� �� �ִ�
 * �뿩�Ѵ� : rent_date �� �뿩����, exp_date �� �ݳ����������̸� rent_date +14
 * �ݳ��Ѵ� : return date �� �ݳ�����, dalay_days�� ��ü �ϼ� return date - exp_date
 * ���� ���� �� Ȯ���ϴ� ó������ : return_date �� null �̸� �뿩�� , null�� �ƴϸ� �ݳ��� ����
 */
--1) ������ �߰��մϴ�. ��B1102�� , ����Ʈ����ũ �����⡯, ����ö���� ,��KBO�� , ��2020-11-10����
INSERT INTO tbl_book (bcode,title,WRITER,PUBLISHER,PDATE)
VALUES('B1102','��Ʈ����ũ ������','��ö��','KBO','2022-11-10');

--2) �ݳ��� ������ ��ü�ϼ��� ����Ͽ� delay_days �÷����� update �մϴ�.
UPDATE TBL_BOOKRENT SET DELAY_DAYS  = RETURN_DATE  - EXP_DATE
WHERE RETURN_DATE  IS NOT NULL;
SELECT * FROM TBL_BOOKRENT tb ;

--3) ���� ���� ������ ��ü�ϼ� ����ؼ� ȸ�� IDX, �����ڵ�, ��ü�ϼ� ��ȸ�ϱ�
--���� ��¥ sysdate �� ����� ������ �������� �ʾ� �׳��ϸ� long ������ ���˴ϴ�
SELECT  mem_idx, bcode, to_date(to_char(SYSDATE,'yyyy-MM-dd')) - exp_date 
FROM TBL_BOOKRENT tb  WHERE RETURN_DATE IS NULL;
--�Ǵ�
SELECT  mem_idx, bcode, trunc(SYSDATE) - EXP_DATE  
FROM TBL_BOOKRENT tb  WHERE RETURN_DATE IS NULL;

--4) ���� �������� ���� �� ��ü�� ȸ���� �̸�,��ȭ��ȣ�� �˻��մϴ�. ���� ��¥ sysdate �������� Ȯ���ϱ�
-- ���� �������� ��ü ���ΰ��� �ݳ����� < ���糯¥ 
SELECT NAME,tel FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEM_IDX = tb.MEM_IDX AND SYSDATE > exp_date AND return_date IS NULL;

--5) ���� �������� ������ �������ڵ�� ������ �˻��մϴ�.
SELECT tb.BCODE ,TITLE  FROM TBL_BOOK tb  JOIN TBL_BOOKRENT tb2
ON tb.BCODE =tb2.BCODE  AND return_date IS NULL;

--6) ���� ������ �뿩�� ȸ���� IDX�� ȸ���̸��� �˻��մϴ�
SELECT bm.MEM_IDX , NAME FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEM_IDX =tb.MEM_IDX AND return_date IS NULL;

--7) �������� ������ ȸ���̸�,������,�ݳ����� �˻��մϴ�
SELECT bm.name, tb.title, tb2.exp_date
FROM BOOK_MEMBER bm ,TBL_BOOK tb , TBL_BOOKRENT tb2 
WHERE bm.MEM_IDX = tb2.MEM_IDX AND tb.BCODE = tb2.BCODE 
AND tb2.RETURN_DATE IS NULL;

--�Ǵ�
SELECT name, title, exp_date FROM TBL_BOOKRENT tb 
JOIN TBL_BOOK tb2 ON tb2.BCODE = tb.BCODE 
JOIN BOOK_MEMBER bm ON tb.MEM_IDX =bm.MEM_IDX 
WHERE RETURN_DATE IS NULL;

--8) ���� ��ü ���� ������ ȸ��IDX, �����ڵ�, �ݳ������� �˻��մϴ�.
SELECT mem_idx, bcode, exp_date FROM TBL_BOOKRENT tb 
WHERE SYSDATE > EXP_DATE ;

--9) ȸ��  IDX ��10002���� ���� ������ �������� ���ν����� �ۼ��մϴ�.
DECLARE 
	vcnt NUMBER;
BEGIN 	
SELECT COUNT(*) 
INTO vcnt 			--SELECT ��ȸ ��� ������ ����. ������ , �� ������ �� ����.
FROM TBL_BOOKRENT tb
WHERE MEM_IDX = 10001 AND RETURN_DATE IS NULL;  -- rent�� 0�϶��� �뿩����
if(vcnt = 0) THEN
	DBMS_OUTPUT.put_line('å �뿩 �����մϴ�.');
ELSE
	DBMS_OUTPUT.put_line('�뿩 ���� å�� �ݳ��ؾ� �����մϴ�.');
END IF;
END;


CREATE OR REPLACE PROCEDURE check_member(
	arg_mem IN book_member.MEM_IDX%TYPE,			--���ν��� ������ �� ���� ���� �Ű�����
	isOK OUT varchar2							--�ڹ��� ���ϰ� �ش��ϴ� �κ�.
)
IS 
		vcnt NUMBER;
		vname varchar2(100);
	BEGIN 	
		-- �Է¸Ű������� ���� ȸ���ΰ��� Ȯ���ϴ� sql�� exception �۸�.
		-- arg_mem���� ȸ�����̺��� name ��ȸ ������ exception
		SELECT name INTO vname
			FROM BOOK_MEMBER bm WHERE MEM_IDX =arg_mem;
		
		SELECT COUNT(*) 
		INTO vcnt 
		FROM TBL_BOOKRENT tb
		WHERE MEM_IDX = arg_mem AND RETURN_DATE IS NULL;  -- rent�� 0�϶��� �뿩����
		if(vcnt = 0) THEN
			DBMS_OUTPUT.put_line('å �뿩 �����մϴ�.');
			isOK := '����';
		ELSE
			DBMS_OUTPUT.put_line('�뿩 ���� å�� �ݳ��ؾ� �����մϴ�.');
			isOK := '�Ұ���';
		END IF;
	EXCEPTION 	
		WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('ã�� ID�� �����ϴ�.');
		isOK :='no match';
END;

-- ���ν��� �����ϱ�
DECLARE 
	vresult varchar2(20);
BEGIN
	CHECK_member(10004,vresult);
	DBMS_OUTPUT.put_line('��� : ' || vresult);
END;


--10) ������ ���н�Ʈ�� ��� ������ ������ �������� ���ν����� �ۼ��մϴ�.
DECLARE
	v_bcode varchar2(100);
	v_cnt NUMBER;
BEGIN
	SELECT bcode INTO v_bcode		--v_bcode�� 'A1102'
		FROM TBL_BOOK tb WHERE title = '�佺Ʈ';
	SELECT count(*) INTO v_cnt			--v_cnt���� 1�̸� v_bcode å�� ������
		FROM TBL_BOOKRENT tb2 WHERE BCODE = v_bcode AND return_date IS NULL;
if(v_cnt = 1 ) THEN
	DBMS_OUTPUT.put_line('�뿩 ���� å�� �ݳ��ؾ� �����մϴ�.');
ELSE
	DBMS_OUTPUT.put_line('å �뿩 �����մϴ�.');
END IF;
END;


-- check_book ���ν���

CREATE OR REPLACE PROCEDURE CHECK_BOOK(
			arg_book IN tbl_book.title%TYPE,	-- ���ν��� �����Ҷ� ���� ���� �Ű�����
			isOK OUT varchar2		-- �ڹ��� ���ϰ��� �ش��ϴ� �κ�.
	)
	IS 
	v_bcode varchar2(100);
 	v_cnt NUMBER;
 BEGIN
 	SELECT bcode INTO v_bcode		-- v_bcode�� 'A1102'
 		FROM TBL_BOOK tb WHERE title = arg_book;
	-- ���� å�̸� �Է��ϸ� ����. bcode ���� �˻��� �ȵ˴ϴ�.-> Exception 
 	SELECT count(*) INTO v_cnt		-- v_cnt ���� 1�̸� v_bcode å�� ������
		FROM TBL_BOOKRENT tb2 WHERE BCODE = v_bcode AND return_date IS NULL; 
	 IF (v_cnt = 1) THEN 
		DBMS_OUTPUT.put_line('�뿩 ���� å �Դϴ�.');
		isOK := 'FALSE' ;
  	 ELSE 
		DBMS_OUTPUT.put_line('å �뿩 �����մϴ�.');
		isOK := 'TRUE' ;
  	 END IF;
  	
  	-- ���� å�� isOK :='no match';
  	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('ã�� å�� �����ϴ�.');
		isOK :='no match';

END;


DECLARE
	vresult varchar2(100);
BEGIN
	check_book('�佺Ʈ',vresult);
	DBMS_OUTPUT.put_line('��� : ' || vresult);
END;























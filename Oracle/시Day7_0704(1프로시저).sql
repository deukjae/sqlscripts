-- PL/SQL : Procedure(����,����) , ������ �ܼ��� SQL�� Ȯ��� ��� (SQL�� ����� ���α׷�)
--			����,���(if,�ݺ���)�� ����Ͽ� ���α׷��־��� ���� sql ������ �帧�� ����

--���� : ������ ���ν����� ����� ����� �����ϴ�.(������� �Ϸ��� sql developer ���)
DECLARE   -- ���������  
	--vcustomid varchar2(20);
	--vage number(3,0);
	vname tbl_custom.name %TYPE; --����� ���̺��� �÷��� ���������� ����
	vage tbl_custom.age %TYPE;

BEGIN		--���ν��� ����
-- ���ν��� ���ο��� �ַ� DML ��ɹ����� �ۼ�.(�Բ� �����ؾ��� ���� SQL : Ʈ�����)
	SELECT name,age 
	INTO vname , vage	-- ���ν��� ����: �˻������ ������ ����
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID ='hongGD';		-- 1�� �ุ ��� ��ȸ�Ǵ� ����
									-- ������ �� ��ȸ�� ���� �ٸ� cursor �ʿ�	
-- �������� �ֿܼ� ���(���ν��� ���)
	DBMS_OUTPUT.PUT_LINE('���̸� : ' || vname);
	DBMS_OUTPUT.PUT_LINE('������ : ' || vage);
	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   -- ���� �̸��� �پ��մϴ�. ���� : no_data_found 
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');
END;

-- ����Ŭ ��ü ���ν��� ���� : �˻��� ���� �Ű������� �����ϱ�

CREATE OR REPLACE PROCEDURE search_custom( -- ���ν��� �̸� ����
	c_id IN tbl_custom.CUSTOM_ID %TYPE		--�Ű����� IN 
											--���ϰ� out
)
IS 
	--�Ϲ� ���� ����
	vname tbl_custom.name %TYPE;
	vage tbl_custom.age %TYPE;
BEGIN	

	SELECT name,age 
	INTO vname , vage
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID =c_id;		

	DBMS_OUTPUT.PUT_LINE('���̸� : ' || vname);
	DBMS_OUTPUT.PUT_LINE('������ : ' || vage);
	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN 
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');
END;


BEGIN
	SEARCH_custom('twice');
END;

-- ���(���ϰ�)�� �ִ� ���ν���
CREATE OR REPLACE PROCEDURE search_custom2(	-- ���ν��� �̸� ����
	c_id IN tbl_custom.CUSTOM_ID %TYPE,		-- �Ű����� IN 
	c_name OUT tbl_custom.NAME %TYPE		-- ���ϰ� ���ν��� ��� OUT
)
IS 
	-- �Ϲ� ���� ����
--	vname tbl_custom.name %TYPE;	-- ������ ���̺��� �÷��� ���������� ����
--	vage tbl_custom.age %TYPE;
BEGIN 
	SELECT name
	INTO c_name 	
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID =c_id;		-- 1�� �ุ ��� ��ȸ�Ǵ� ����
	
	DBMS_OUTPUT.PUT_LINE('���� �˻��Ͽ����ϴ�.' || c_id);  
	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');	
		c_name := 'no match';		--���Թ� := ��ȣ
END;


-- ���(���ϰ�)�� �ִ� ���ν��� ���� : ��°� ������ ���� ���� �ʿ��մϴ�
DECLARE 
	vname tbl_custom.name %TYPE;
BEGIN
	search_custom2('momo',vname); --vname�� ���ν��� ������ �� OUT���� ����.
--	vname := search_custom2('mina012')l �� ���� ������ �ƴմϴ�
	DBMS_OUTPUT.PUT_LINE('*���̸� : ' || vname);
END;


--begin ~ end ���� �ϳ��� Ʈ������� �����ϴ� DML(insert,update,delete ����) ��ɵ�� ����
--		������ ����� exception ���� rollback; ������ �������� commit;


--���ν����� �� �� �ִ� ��� SQL
--������ ������ ���� ���̺� �����
CREATE TABLE tbl_temp
AS
SELECT * FROM TBL_CUSTOM tc WHERE CUSTOM_ID  = '0';

--SELECT �� ����� insert �ϱ�
INSERT INTO tbl_temp(SELECT * FROM tbl_custom WHERE custom_ID = 'wonder');

SELECT  * FROM TBL_TEMP tt ;


--function ����Ŭ ��ü�� ��
--����Ŭ �Լ� : upper,lower, decode, round, to_date, to_char....
--function�� ����� �Լ��� �����մϴ�. ���̺��� ������� �ϴ°��� �ƴ϶� Ư�� �����͸� �����ϴ� ����








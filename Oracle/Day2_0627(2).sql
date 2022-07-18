-- ���ڿ� Ÿ��
-- CHAR(����) : �������� , ������ ����Ʈ 
-- VARCHAR(����) : ����Ŭ���� ���������� ������� �ʴ� �����ڷ���.
-- VARCHAR2(����) : ���������� ���� ����Ʈ, ���̴� �ִ�����̰� ������ �޸𸮴� ������ũ�⸸ŭ ����մϴ�.
--				�ִ� 2000����Ʈ�Դϴ�. UTF-8 ���ڵ����� �ѱ��� 3����Ʈ, ����/����/��ȣ�� 1����Ʈ

CREATE TABLE tbl_String(
	acol char(10),			-- 10����Ʈ ��������
	bcol varchar2(10),
	ccol nchar(10),			-- 10�� ���� ��������
	dcol nvarchar2(10)		-- 10�� ���� ��������
	
);

-- char Ÿ��
INSERT  INTO TBL_String(acol) values('ancdefghij');
INSERT  INTO TBL_String(acol) values('ancdef');			-- acol�� �������� Ÿ�� : ���� 4�� �߰�
INSERT  INTO TBL_String(acol) values('ancdefghijklm');	-- ����: ���� �ʰ�

-- INSERT Ȯ��
SELECT * FROM TBL_STRING;

-- �ѱ� Ȯ��
INSERT INTO TBL_STRING(acol) values('������');	-- ���� 1��
INSERT INTO TBL_STRING(acol) values('�����ٶ�'); 	-- ���� : ���� ���� ���� �ʹ� ŭ(����: 12, �ִ밪: 10)
INSERT INTO TBL_STRING(acol) values('����');		-- ���� 4��


-- varchar2 Ÿ�� : bcol�� �������� 10����Ʈ
INSERT  INTO TBL_String(bcol) values('ancdefghij');
INSERT  INTO TBL_String(bcol) values('ancdef');			-- bcol�� �������� Ÿ��
INSERT  INTO TBL_String(bcol) values('ancdefghijklm');	-- ����: ���� �ʰ�

-- INSERT Ȯ��
SELECT * FROM TBL_STRING;

-- �ѱ� Ȯ��
INSERT INTO TBL_STRING(bcol) values('������');	-- ���� �߰� ����
INSERT INTO TBL_STRING(bcol) values('�����ٶ�'); 	-- ���� : ���� ���� ���� �ʹ� ŭ(����: 12, �ִ밪: 10)
INSERT INTO TBL_STRING(bcol) values('����');		-- ���� �߰� ����


-- char �� varchar2�� ����Ʈ ����. nchar�� nvarchar2 �� ���ڰ��� ����(�ٱ��� ���ڰ� ���� ���ԵǴ� �÷��� ����)
-- nchar Ÿ��
INSERT INTO TBL_STRING(ccol) values('������');	-- ���� 7�� �߰�
INSERT INTO TBL_STRING(ccol) values('�����ٶ�'); 	-- ���� 6�� �߰�
INSERT INTO TBL_STRING(ccol) values('����');		-- ���� 8�� �߰� 
INSERT INTO TBL_STRING(ccol) values('�����ٶ󸶹ٻ������ī');		-- ���� : ���� �ʰ� 
-- nvarchar2 Ÿ��
INSERT INTO TBL_STRING(dcol) values('������');	-- 
INSERT INTO TBL_STRING(dcol) values('�����ٶ�'); 	-- 
INSERT INTO TBL_STRING(dcol) values('����');		-- 
INSERT INTO TBL_STRING(dcol) values('�����ٶ󸶹ٻ������ī');		-- ���� : ���� �ʰ�

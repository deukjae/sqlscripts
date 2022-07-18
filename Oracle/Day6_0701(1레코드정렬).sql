-- SELECT �⺻����
-- SELECT �÷�1,�÷�2,... from ���̺�� WHERE �˻����ǽ� order by �����÷� desc/asc
--					order by ����÷�(���� : asc, ���� : desc)

SELECT * FROM TBL_BUY tb ;
SELECT * FROM TBL_CUSTOM tc ;
SELECT * FROM TBL_CUSTOM tc ORDER BY CUSTOM_ID ;
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID = 'mina012';
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID = 'mina012'
							ORDER BY BUY_DATE DESC; -- WHERE , ORDER BY ���� ��ŵ�ϴ�.
							

-- ��ȸ�� �÷� ������ �� DISTINCT Ű���� : �ߺ����� 1���� ��� ���
SELECT custom_id FROM TBL_BUY tb ; --���Ű� ID��ȸ
SELECT DISTINCT custom_id FROM TBL_BUY tb ; -- �ߺ����� 1����

-- 6/30 ���� ����
--1. age �� 30�� �̻� ���� ��� �÷� ��ȸ
SELECT * FROM TBL_CUSTOM tc WHERE age >= 30;
--2. custom_id 'twice' �� email ��ȸ
SELECT email FROM TBL_CUSTOM WHERE CUSTOM_ID ='twice';
--3. category 'A2' �� pname ��ȸ
SELECT pname FROM TBL_PRODUCT tp WHERE CATEGORY ='A2';
--4. ��ǰ price�� �ְ� ��ȸ
SELECT max(price) FROM TBL_PRODUCT price;
--5. 'IPAD001' �ѱ��� ���� ��ȸ
SELECT sum(quantity) FROM TBL_BUY quantity WHERE pcode = 'IPAD011';
--6. custom_id 'mina012'�� ������ ���� ��ȸ
SELECT pcode FROM TBL_BUY WHERE CUSTOM_ID = 'mina012';
--7. ���� ��ǰ �� pcode�� '0'�� ���Ե� �� ��ȸ
SELECT * FROM TBL_BUY tb WHERE PCODE LIKE ('%0%');
--8. ���� ��ǰ �� pcode�� 'on'�� �����ϴ� �� ��ȸ(��ҹ��� ���о��� ��ȸ)
SELECT * FROM TBL_BUY tb WHERE PCODE LIKE UPPER('%on%'); 
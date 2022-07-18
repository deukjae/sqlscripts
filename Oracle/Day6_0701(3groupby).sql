-- ���� : ���� �׷�ȭ �մϴ� ����ϴ� ������ �Ʒ�ó�� �մϴ�
-- SELECT �׷��Լ� from ���̺� �̸�
-- [where] �׷�ȭ �ϱ� ���� ����� ���ǽ�
-- GROUP BY �׷�ȭ�� ����� �÷���
-- [HAVING] �׷�ȭ ����� ���� ���ǽ�
-- [ORDER BY] �׷�ȭ ��� ������ �÷���� ���

SELECT pcode, count(*) FROM TBL_BUY tb GROUP BY PCODE ;
SELECT pcode, count(*),sum(quantity) 
	FROM TBL_BUY tb 
	GROUP BY PCODE
	ORDER BY 2; -- ��ȸ�� �÷��� ��ġ
	
SELECT pcode, count(*) cnt ,sum(quantity) total 
	FROM TBL_BUY tb 
	GROUP BY PCODE
	ORDER BY cnt; -- �׷��Լ� ����� ��Ī

-- �׷�ȭ �Ŀ� �����հ谡 3 �̻��� ��ȸ
SELECT pcode, count(*) cnt ,sum(quantity) total 
	FROM TBL_BUY tb 
	GROUP BY PCODE
--	HAVING total >= 3 having���� �÷� ��Ī ��� ����. ���̺� �÷����� ����� �� ����
	HAVING sum(QUANTITY) >=3
	ORDER BY cnt; -- �׷��Լ� ����� ��Ī

--���ų�¥ 2022-04-01 ������ �͸� �׷�ȭ�Ͽ� ��ȸ
SELECT pcode, count(*) cnt ,sum(quantity) total 
	FROM TBL_BUY tb 
	WHERE BUY_DATE >= '2022-04-01'
	GROUP BY PCODE 
	ORDER BY cnt;

	
	

--day2 ����
-- ��� �Լ� : count, avg, max, min ��� �Լ��� �׷��Լ���� �մϴ�
--	�ش� �Լ� ������� ���ϱ� ���� Ư�� �÷� ����Ͽ� ���� �����͸� �׷�ȭ�� �� ����

SELECT count(*) FROM EMPLOYEES e ;		--���̺� ��ü ������ ���� : 107
SELECT max(salary) FROM EMPLOYEES e ;	-- salary �÷��� �ִ밪 : 24000
SELECT min(salary) FROM EMPLOYEES e ;   --             �ּҰ� : 2100
SELECT AVG(salary) FROM EMPLOYEES e ;   --             ��հ� : 6461.83....
SELECT sum(salary) FROM EMPLOYEES e ;   --             �հ� : 691416

-- �� 5�� ����Լ��� JOB_ID = 'IT_PROG' ���� ���ǽ����� �Ȱ��� �����غ���
SELECT count(*) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG';		--5
SELECT max(salary) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG';	-- 9000
SELECT min(salary) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG';	-- 4200
SELECT AVG(salary) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG';	-- 5760           
SELECT sum(salary) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG';	-- 28800

-- ����Լ� ����� �ٸ� �÷����� ���� ��ȸ�� �� ����.(�׷��Լ��̱� ������)

SELECT JOB_ID ,count(*) FROM EMPLOYEES e 
WHERE JOB_ID ='IT_PROG';












-- 1. hire_date�� 2006�� 1�� 1�� ������ ������ �̸�,��,�̸���
SELECT FIRST_NAME, LAST_NAME ,EMAIL  FROM EMPLOYEES WHERE hire_date < '2006/01/01';

-- 2. lastname�� 'Jones' �� ������ ��� �÷�
SELECT * FROM EMPLOYEES WHERE LAST_NAME = 'Jones';
-- ��ҹ��� �˻�� ���Ŀ� �����ؾ��մϴ�.
-- �÷����� ��ҹ��� ��ȯ �� ���ǰ� �� -> ��ҹ��� �����ϰ� �˻��ϴ� ���
SELECT * FROM EMPLOYEES WHERE upper(LAST_NAME) = 'JONES';
SELECT * FROM EMPLOYEES WHERE LOWER(LAST_NAME) = 'jones';

-- 3. salary �� 5000 �̻��� ������ �̸�,��,JOB_ID ��ȸ
SELECT FIRST_NAME ,LAST_NAME ,JOB_ID FROM EMPLOYEES 
WHERE salary >= 5000;

-- 4. JOB_ID �� ACCOUNT �� ���� ������ �̸�,��,salary ��ȸ
SELECT FIRST_NAME ,LAST_NAME ,SALARY  FROM EMPLOYEES 
WHERE job_id LIKE '%ACCOUNT%';

-- 5. �μ�_ID �� 50 ,60, 80,90 �� ������ ����_ID, �̸�,�� ��ȸ
SELECT EMPLOYEE_ID ,FIRST_NAME ,LAST_NAME  FROM EMPLOYEES 
WHERE DEPARTMENT_ID in(50,60,80,90);


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

-- ������ ��� : create table, insert into, select ~ where ~ �⺻����
-- ���� : ��Ī(alias)
SELECT * FROM EMPLOYEES e ;			--EMPLOYEES ���̺��� ��Ī e
SELECT * FROM DEPARTMENTS d ;		--DEPARTMENTS ���̺��� ��Ī d
-- �������� ���� ��Ī�� �ʿ�����ϴ�. �׷� ������ �����ϰ� ���ϴ�.


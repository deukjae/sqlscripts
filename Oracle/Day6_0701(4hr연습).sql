-- ���ΰ� group by �� �����ؼ� select �� �˻��ϴ� ������ 10�� �����
-- group by ����ε� ������ �� �� �ֽ��ϴ�.

-- �ּ����� �˻��ϴ� ���� ���� SELECT ���� �ۼ��ϼ���


SELECT MAX_SALARY 
	FROM EMPLOYEES e
	JOIN JOBS j 
	ON e.JOB_ID = j.JOB_ID 
	AND EMPLOYEE_ID = 166;


--�׷��Լ� ��ȸ�� �� group by�� ��� �׷���̿� �� �÷��� select �� ��ȸ�� �� �ֽ��ϴ�.
-- 		�׷���� �÷� �ܿ��� �ٸ� �÷� select �� �� �����ϴ� ->join,��������
--1�ܰ� : ����� �׷��Լ� �����ϱ�
SELECT department_ID , avg(salary) FROM EMPLOYEES e GROUP BY DEPARTMENT_ID ;

--2�ܰ� : �����ϱ�
SELECT * FROM DEPARTMENTS d JOIN
		(SELECT DEPARTMENT_ID,avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID = tavg.department_ID;
	
--3�ܰ� : �÷� �����ϱ�
SELECT d.DEPARTMENT_ID,d.DEPARTMENT_NAME,ROUND(tavg.cavg,1) FROM DEPARTMENTS d 
		JOIN
		(SELECT DEPARTMENT_ID, avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID  = tavg.DEPARTMENT_ID
		ORDER BY tavg.cavg DESC;

--4�ܰ� : ������ ����� Ư�� ��ġ ���� : first n�� ���� n���� ��ȸ
SELECT d.DEPARTMENT_ID,d.DEPARTMENT_NAME,ROUND(tavg.cavg,1) FROM DEPARTMENTS d 
		JOIN
		(SELECT DEPARTMENT_ID, avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID = tavg.DEPARTMENT_ID
		ORDER BY tavg.cavg DESC
		FETCH FIRST 1 ROWS ONLY;

--����Ŭ�� rownum�� ������ �÷����� ��ȸ�� ����� ���������� ����Ŭ�� �ο��ϴ� ���Դϴ�.
--				���� Ŀ�� ����� ���� join�� �ѹ� �� �ʿ��մϴ�
SELECT rownum,tcnt.* FROM
(SELECT department_ID, count(*) cnt FROM EMPLOYEES e
		GROUP BY DEPARTMENT_ID ORDER BY cnt desc) tcnt
WHERE rownum < 5;

SELECT rownum,tcnt.* FROM
(SELECT department_ID, count(*) cnt FROM EMPLOYEES e
		GROUP BY DEPARTMENT_ID ORDER BY cnt desc) tcnt
WHERE rownum = 1;

-- rownum ����� �� ��� Ȯ���� �ȵǴ� ���� : rownum 1���� �����ؼ� ã�ư� �� �ִ� ���ǽĸ� ����
-- where rownum = 3;
-- where rownum > 5;
-- �׷��� �ѹ��� rownum �� ������ ��ȸ ����� select�� �մϴ� �� �� rownum�� ��Ī �ο�
SELECT * FROM
(SELECT  rownum rn,tcnt.* FROM
(SELECT department_ID, count(*) cnt FROM EMPLOYEES e
		GROUP BY DEPARTMENT_ID ORDER BY cnt desc) tcnt)
WHERE rn BETWEEN 5 AND 9;
-- WHERE rn = 3;






SELECT count(*) FROM EMPLOYEES e ;		--���̺� ��ü ������ ���� : 107
SELECT max(salary) FROM EMPLOYEES e ;	-- salary �÷��� �ִ밪 : 24000
SELECT min(salary) FROM EMPLOYEES e ;   --             �ּҰ� : 2100
SELECT AVG(salary) FROM EMPLOYEES e ;   --             ��հ� : 6461.83....
SELECT sum(salary) FROM EMPLOYEES e ; 
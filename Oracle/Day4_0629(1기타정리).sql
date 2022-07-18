-- DDL : create, alter, drop, TRUNCATE
-- (����� user, table, sequence, view, .. �� truncate�� ���̺� ���)
-- DML : insert, update, delete, 

-- drop ���� ���� - �ܷ�Ű�� ���� �����Ǵ� ����/ �⺻ Ű�� ���̺� ���� ���

-- update ���̺�� set �÷��� = ��, �÷��� = ��, �÷��� = ��,...
-- WHERE �����÷� �����
-- DELETE FROM ���̺�� WHERE �����÷����Խ�
-- ���� �� �� : UPDATE �� delete �� where ���� ����ϴ� ���� ������ ����.
--			TRUNCATE �� ���� ���(rollback)�� �� ���� ������ DDL�� ���մϴ�

UPDATE STUDENTS SET age = 17 WHERE stuno = 2021001;
-- UPDATE, delete, select ���� where�� �÷��� �⺻Ű �÷��̸�
--		����Ǵ� ��� �ݿ��Ǵ� ���� ��ϱ��? �ִ� 1��
--		�⺻Ű�� ������ ���̺��� ��������� ����(�ĺ�)
SELECT * FROM STUDENTS s ;

-- rollback , commit �׽�Ʈ (�����ͺ��̽� �޴����� Ʈ����� ��带 manual�� �����մϴ�)
UPDATE STUDENTS SET ADDRESS = '���ϱ�',age= 16 WHERE STUNO = 2021001;
ROLLBACK; -- ���� UPDATE ������ ���
UPDATE STUDENTS SET ADDRESS = '���ϱ�',age= 16 WHERE STUNO = 2021001;
COMMIT;
SELECT * FROM STUDENTS s ; -- '���ϱ�', 16���� �ݿ���
ROLLBACK;
SELECT * FROM STUDENTS s ; -- �̹� commit�� �� ��ɾ�� ROLLBACK ����
-----------------------------------------------�����
-- Ʈ����� ������� : rollback, commit

DELETE FROM SCORES;
ROLLBACK;
DELETE FROM SCORES WHERE stuno = 2019019;
ROLLBACK;
SELECT * FROM SCORES;

-- �� ������� Ʈ����� ���� ����̰� ���� â������ select ��� 2019019�� �����ϴ�
-- �ٸ� ������� �ٸ� Ŭ���̾�Ʈ�̹Ƿ� ���� ����(���� Ŀ���� ����)�� �������ϴ�.
ROLLBACK;

TRUNCATE TABLE SCORES ; -- ��� �����͸� ����ϴ� ROLLBACK ���� Ȯ��?
						-- �� : rollback �Ұ�
--��� �����͸� ������� Ȯ���ϸ� �ٸ��͵�� ������ �ѹ���� �ʰ� Ȯ���ϰ� TRUNCATE �ض�
----------------------------------------------------------
SELECT * FROM STUDENTS s ;
/*
 * 
 * insert
 * delete
 * commit;	
 * update
 * delete;
 * rollback;
 * insert;
 * insert;
 * rollback;
 * insert;
 * update;
 * commit;
 */




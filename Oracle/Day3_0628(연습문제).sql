CREATE TABLE students(
	"�л��й�" char(7) PRIMARY KEY,
	"�̸�" varchar2(10) NOT NULL,
	"����" number(3),
	"�ּ�" nvarchar2(20)
);

INSERT INTO STUDENTS VALUES (2021001,'����',16,'���ʱ�');
INSERT INTO STUDENTS VALUES (2019019,'������',18,'������');

CREATE TABLE scores(
	"�л��й�" char(7) NOT NULL,
	"�����" varchar2(10) NOT NULL,
	"����" number(3) NOT NULL,
	"��米��" nvarchar2(10) NOT NULL,
	"�����б�" nvarchar2(10) NOT NULL
);

INSERT INTO SCORES 
VALUES (2021001,'����',89,'�̳���','2022_1');
INSERT INTO SCORES 
VALUES (2021001,'����',78,'��浿','2022_1');
INSERT INTO SCORES 
VALUES (2021001,'����',67,'�ڼ���','2021_2');
INSERT INTO SCORES
VALUES (2019019,'����',92,'�̳���','2019_2');
INSERT INTO SCORES
VALUES (2019019,'����',85,'������','2019_2');
INSERT INTO SCORES 
VALUES (2019019,'����',88,'�ڼ���','2020_1');
------------------------------------------------------------
------------------------------------------------------------
CREATE TABLE students(
	stuno char(7) PRIMARY KEY,
	name nvarchar2(20) NOT NULL,
	age number(3) CHECK (age BETWEEN 10 AND 30),
	address nvarchar2(50)
);

INSERT INTO students(stuno,name,age,address)
VALUES ('2021001','����',16,'���ʱ�');
INSERT INTO students(stuno,name,age,address)
VALUES ('2019019','������',18,'������');

CREATE TABLE scores(
	stuno char(7),
	subject nvarchar2(20),
	jumsu number(3) NOT NULL,	-- ����
	teacher nvarchar2(20) NOT NULL,
	term char(6) NOT NULL	-- �б�
--	PRIMARY KEY (stuno,subject),	-- �⺻Ű ����
--	FOREIGN KEY (stuno) REFERENCES students(stuno)
	-- �ܷ�Ű���� REFERENCES(����) Ű���� �ڿ� ���� ���̺�(�����÷�)
	-- �ܷ�Ű �÷��� FOREIGN KEY Ű���� �ڿ� (���ھ����̺� stuno) �ȿ� �ۼ� 
	-- �����÷��� ������? �⺻Ű �Ǵ� unique �������� �÷��� �˴ϴ�.
);

--ALTER table ~ add constraint
ALTER TABLE SCORES 
		ADD CONSTRAINT pk_scores PRIMARY KEY (stuno,subject);
ALTER TABLE SCORES 
		ADD CONSTRAINT fk_scores FOREIGN KEY (stuno)
		REFERENCES students(stuno);

INSERT INTO scores
VALUES ('2021001','����',89,'�̳���','2022_1');
INSERT INTO scores
VALUES ('2021001','����',78,'��浿','2022_1');
INSERT INTO scores
VALUES ('2021001','����',67,'�ڼ���','2021_2');
INSERT INTO scores
VALUES ('2019019','����',92,'�̳���','2019_2');
INSERT INTO scores
VALUES ('2019019','����',85,'������','2019_2');
INSERT INTO scores
VALUES ('2019019','����',88,'�ڼ���','2020_1');
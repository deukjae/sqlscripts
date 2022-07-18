//�ۼ��� : �ȵ���

CREATE TABLE tbl_custom(
	custom_id varchar2(20) PRIMARY KEY,
	name nvarchar2(20) NOT NULL,
	email varchar2(20),
	age number(3),
	reg_date DATE DEFAULT sysdate 
);

CREATE TABLE tbl_product(
	pcode varchar2(20) PRIMARY KEY,
	category char(2) NOT NULL,
	pname nvarchar2(20) NOT NULL,
	price number(9) NOT null
);

CREATE TABLE tbl_buy(
	custom_id varchar2(20) NOT NULL,
	pcode varchar2(20) NOT NULL,
	quantity number(5) NOT NULL,
	buy_date DATE DEFAULT sysdate
);

-- DATE ���Ŀ� �����Ǵ� ���� �����ϱ�
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

INSERT INTO tbl_custom VALUES ('mina012','��̳�','kimm@gmail.com',20,('2022-03-10 14:23:25'));
INSERT INTO tbl_custom VALUES ('hongGD','ȫ�浿','gil@korea.com',32,to_date('2021-10-21 00:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tbl_custom VALUES ('twice','�ڸ��','momo@daum.net',29,to_date('2021-12-25 00:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tbl_custom VALUES ('wonder','�̳���','lee@naver.com',40,sysdate);
SELECT * FROM tbl_custom;

INSERT INTO tbl_product VALUES ('IPAD011','A1','�����е�10',880000);
INSERT INTO tbl_product VALUES ('DOWON123a','B1','������ġ������Ʈ',54000);
INSERT INTO tbl_product VALUES ('dk_143','A2','��ǵ���ũ',234500);
SELECT * FROM tbl_product;

INSERT INTO tbl_buy VALUES ('mina012','IPAD011',1,to_date('2022-02-06 00:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tbl_buy VALUES ('hongGD','IPAD011',2,to_date('2022-06-29 20:37:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tbl_buy VALUES ('wonder','DOWON123a',3,to_date('2022-02-06 00:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tbl_buy VALUES ('mina012','dk_143',1,sysdate);
INSERT INTO tbl_buy VALUES ('twice','DOWON123a',2,to_date('2022-02-09 08:49:55','YYYY-MM-DD HH24:MI:SS'));
SELECT * FROM tbl_buy

ALTER TABLE tbl_buy ADD buyNO number(8);
update tbl_buy set BUYNO=1001 WHERE CUSTOM_ID='mina012' AND pcode = 'IPAD011';
update tbl_buy set BUYNO=1002 WHERE CUSTOM_ID='hongGD' AND pcode = 'IPAD011';
update tbl_buy set BUYNO=1003 WHERE CUSTOM_ID='wonder' AND pcode = 'DOWON123a';
update tbl_buy set BUYNO=1004 WHERE CUSTOM_ID='mina012' AND pcode='dk_143');
update tbl_buy set BUYNO=1005 WHERE CUSTOM_ID='twice' AND pcode = 'DOWON123a';

ALTER TABLE TBL_BUY ADD PRIMARY KEY (buyNo);
ALTER TABLE TBL_BUY ADD CONSTRAINT tbl_buy_FK FOREIGN KEY (custom_id) REFERENCES tbl_custom (custom_id);
ALTER TABLE TBL_BUY ADD CONSTRAINT tbl_buy_FK2 FOREIGN KEY (pcode) REFERENCES tbl_product (pcode);

CREATE SEQUENCE tbl_buy_seq INCREMENT BY 1 START WITH 1006;

INSERT INTO TBL_BUY VALUES ('wonder','IPAD011',1,to_date('2022-05-15','YYYY-MM-DD'),tbl_buy_seq.nextval);

SELECT * FROM TBL_CUSTOM WHERE age>=30;
SELECT email FROM TBL_CUSTOM WHERE CUSTOM_ID = 'twice';
SELECT pname FROM TBL_PRODUCT WHERE CATEGORY ='A2';
SELECT MAX(price) FROM TBL_PRODUCT;
SELECT SUM(quantity) FROM TBL_BUY WHERE PCODE = 'IPAD011';
SELECT pcode FROM TBL_BUY WHERE CUSTOM_ID ='mina012';
SELECT pcode FROM TBL_BUY WHERE PCODE LIKE '%0%';
SELECT pcode FROM TBL_BUY WHERE PCODE LIKE UPPER('%on%'); 
SELECT pcode FROM TBL_BUY WHERE PCODE LIKE LOWER('%on%'); 


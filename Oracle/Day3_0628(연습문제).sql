CREATE TABLE students(
	"학생학번" char(7) PRIMARY KEY,
	"이름" varchar2(10) NOT NULL,
	"나이" number(3),
	"주소" nvarchar2(20)
);

INSERT INTO STUDENTS VALUES (2021001,'김모모',16,'서초구');
INSERT INTO STUDENTS VALUES (2019019,'강다현',18,'강남구');

CREATE TABLE scores(
	"학생학번" char(7) NOT NULL,
	"과목명" varchar2(10) NOT NULL,
	"점수" number(3) NOT NULL,
	"담당교사" nvarchar2(10) NOT NULL,
	"수업학기" nvarchar2(10) NOT NULL
);

INSERT INTO SCORES 
VALUES (2021001,'국어',89,'이나연','2022_1');
INSERT INTO SCORES 
VALUES (2021001,'영어',78,'김길동','2022_1');
INSERT INTO SCORES 
VALUES (2021001,'과학',67,'박세리','2021_2');
INSERT INTO SCORES
VALUES (2019019,'국어',92,'이나연','2019_2');
INSERT INTO SCORES
VALUES (2019019,'영어',85,'박지성','2019_2');
INSERT INTO SCORES 
VALUES (2019019,'과학',88,'박세리','2020_1');
------------------------------------------------------------
------------------------------------------------------------
CREATE TABLE students(
	stuno char(7) PRIMARY KEY,
	name nvarchar2(20) NOT NULL,
	age number(3) CHECK (age BETWEEN 10 AND 30),
	address nvarchar2(50)
);

INSERT INTO students(stuno,name,age,address)
VALUES ('2021001','김모모',16,'서초구');
INSERT INTO students(stuno,name,age,address)
VALUES ('2019019','강다현',18,'강남구');

CREATE TABLE scores(
	stuno char(7),
	subject nvarchar2(20),
	jumsu number(3) NOT NULL,	-- 점수
	teacher nvarchar2(20) NOT NULL,
	term char(6) NOT NULL	-- 학기
--	PRIMARY KEY (stuno,subject),	-- 기본키 설정
--	FOREIGN KEY (stuno) REFERENCES students(stuno)
	-- 외래키설정 REFERENCES(참조) 키워드 뒤에 참조 테이블(참조컬럼)
	-- 외래키 컬럼은 FOREIGN KEY 키워드 뒤에 (스코어테이블 stuno) 안에 작성 
	-- 참조컬럼의 조건은? 기본키 또는 unique 제약조건 컬럼만 됩니다.
);

--ALTER table ~ add constraint
ALTER TABLE SCORES 
		ADD CONSTRAINT pk_scores PRIMARY KEY (stuno,subject);
ALTER TABLE SCORES 
		ADD CONSTRAINT fk_scores FOREIGN KEY (stuno)
		REFERENCES students(stuno);

INSERT INTO scores
VALUES ('2021001','국어',89,'이나연','2022_1');
INSERT INTO scores
VALUES ('2021001','영어',78,'김길동','2022_1');
INSERT INTO scores
VALUES ('2021001','과학',67,'박세리','2021_2');
INSERT INTO scores
VALUES ('2019019','국어',92,'이나연','2019_2');
INSERT INTO scores
VALUES ('2019019','영어',85,'박지성','2019_2');
INSERT INTO scores
VALUES ('2019019','과학',88,'박세리','2020_1');
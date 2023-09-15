CREATE TABLE muser(
	id varchar2(20) PRIMARY KEY ,
	password varchar2(50),
	name varchar2(20),
	nickname varchar2(50) NOT NULL,
	birth DATE,
	address varchar2(200)
);

SELECT * FROM MUSER m ;

CREATE TABLE mproduct(
	pname varchar2(200),
	pcode NUMBER PRIMARY KEY ,
	id varchar2(20) REFERENCES muser(id) ,
	price NUMBER,
	brand varchar2(50),
	psize NUMBER,
	category varchar2(20),
	readcount number(10) DEFAULT 0,
	creatAt DATE DEFAULT sysdate
);

create sequence mproduct_pcode_seq;

DROP TABLE MPRODUCT ;
DROP TABLE MUSER ;


SELECT * FROM MPRODUCT m;

CREATE TABLE mcommunity(
	idx number(10) NOT NULL PRIMARY KEY ,
	writer varchar2(50) NOT NULL,
	title varchar2(100) NOT NULL,
	content varchar2(3000) NOT NULL,
	readCount number(10) DEFAULT 0,
	createdAt DATE DEFAULT sysdate,
	commentCount number(10) DEFAULT 0
);

SELECT * FROM MCOMMUNITY m ;

CREATE TABLE mcomment(
	idx number(10) NOT NULL PRIMARY KEY ,
	mref number(10) NOT NULL,
	writer varchar2(50) NOT NULL,
	content varchar2(1000) NOT NULL,
	createdAt DATE DEFAULT sysdate,
	heart number(3) DEFAULT 0
);

SELECT * FROM MCOMMENT m ;

CREATE TABLE mservice(
	idx number(10) NOT NULL PRIMARY KEY ,
	writer varchar2(50) NOT NULL,
	title varchar2(100) NOT NULL,
	content varchar2(3000) NOT NULL,
	readCount number(10) DEFAULT 0,
	createdAt DATE DEFAULT sysdate,
	commentCount number(10) DEFAULT 0
);

SELECT * FROM MSERVICE m;
CREATE TABLE muser(
	id varchar2(20) PRIMARY KEY ,
	password varchar2(100) NOT NULL,
	name varchar2(20),
	nickname varchar2(50) NOT NULL,
	birth DATE,
	address varchar2(200),
	phone varchar2(50)
);


CREATE TABLE mproduct(
	pname varchar2(200),
	pcode NUMBER PRIMARY KEY ,
	id varchar2(20) REFERENCES muser(id) ,
	price NUMBER,
	brand varchar2(50),
	psize NUMBER,
	category varchar2(20),
	readcount number(10) DEFAULT 0,
	creatAt DATE DEFAULT sysdate,
	picture varchar2(100),
	content varchar2(1000),
	buyid varchar2(100),
	status varchar2(100) DEFAULT 0,
	buyat DATE
);

CREATE SEQUENCE mproduct_pcode_seq;

CREATE TABLE mcommunity(
	idx number(10) NOT NULL PRIMARY KEY ,
	writer varchar2(50) NOT NULL,
	title varchar2(100) NOT NULL,
	content varchar2(3000) NOT NULL,
	readCount number(10) DEFAULT 0,
	createdAt DATE DEFAULT sysdate,
	commentCount number(10) DEFAULT 0
);

CREATE SEQUENCE mcommunity_idx_seq;


CREATE TABLE mcomment(
	idx number(10) NOT NULL PRIMARY KEY ,
	mref number(10) NOT NULL,
	writer varchar2(50) NOT NULL,
	content varchar2(1000) NOT NULL,
	createdAt DATE DEFAULT sysdate,
	heart number(3) DEFAULT 0
);


CREATE TABLE mservice(
	idx number(10) NOT NULL PRIMARY KEY ,
	writer varchar2(50) NOT NULL,
	title varchar2(100) NOT NULL,
	content varchar2(3000) NOT NULL,
	readCount number(10) DEFAULT 0,
	createdAt DATE DEFAULT sysdate,
	commentCount number(10) DEFAULT 0
);

CREATE TABLE MBUY (
    pcode NUMBER,  
    pname varchar2(300),         
    id VARCHAR2(20) REFERENCES muser(id),     
    requestprice NUMBER,    
    buyid VARCHAR2(20),       
    buyPhone VARCHAR2(20),     
    buyaddress VARCHAR2(20)   
);

CREATE TABLE mqcomments (
   idx number(10) NOT NULL,      -- 기본키
   mref number(10) NOT NULL,   -- community 테이블의 idx   
   writer varchar2(50) NOT NULL,   -- 작성자
   content varchar2(1000) NOT NULL,  -- 댓글 내용
   createdAt DATE default sysdate ,  -- 작성날짜와시간 기본값
   heart number(3) default '0',   -- 좋아요 갯수
   primary  key (idx)
);
CREATE SEQUENCE mqcomment_idx_seq;

CREATE TABLE mqa(
   idx number(10) NOT NULL PRIMARY KEY ,
   writer varchar2(50) NOT NULL,
   title varchar2(100) NOT NULL,
   content varchar2(3000) NOT NULL,
   readCount number(10) DEFAULT 0,
   createdAt DATE DEFAULT sysdate,
   commentCount number(10) DEFAULT 0
);

CREATE SEQUENCE mqa_idx_seq;

CREATE TABLE message (
    m_idx number(10) PRIMARY KEY ,
    sendid varchar2(100) REFERENCES muser(id) ,
    reciveid varchar2(100) REFERENCES muser(id) ,
    message varchar2(1000) ,
    m_date DATE DEFAULT sysdate
);

CREATE SEQUENCE message_idx_seq;




DROP TABLE muser;
DROP TABLE mproduct;
DROP TABLE mcommunity;
DROP TABLE mcomment;
DROP TABLE mservice;
DROP TABLE MBUY;
DROP TABLE mqcomments;
DROP TABLE mqa;
UPDATE message SET status =1 WHERE m_idx=49;
update message set status = 1 where m_idx=12;

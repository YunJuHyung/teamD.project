insert into MUSER(id,password,name,nickname,birth,address)
values ('witmrv','a1234','이종원','이','1998-02-23','경기도');
insert into MUSER(id,password,name,nickname,birth,address)
values ('twice','a1234','김미나','가','2001-01-23','서울');
insert into MUSER(id,password,name,nickname,birth,address)
values ('mina012','a1234','홍길동','다','1996-06-21','부산');
insert into MUSER(id,password,name,nickname,birth,address)
values ('hongGD','a1234','이사나','나','1985-07-01','양양');
insert into MUSER(id,password,name,nickname,birth,address)
values ('sana','a1234','이나나','라','2001-10-23','제주');


insert into MPRODUCT(Pname,Pcode,Id,price,brand,psize,category) 
values ('나이키 에어포스',mproduct_pcode_seq.nextval,'witmrv',20000,'나이키',260,'운동화');
insert into MPRODUCT(Pname,Pcode,Id,price,brand,psize,category) 
values ('조던',mproduct_pcode_seq.nextval,'twice',30000,'나이키',255,'운동화');
insert into MPRODUCT(Pname,Pcode,Id,price,brand,psize,category) 
values ('컨버스',mproduct_pcode_seq.nextval,'mina012',15000,'컨버스',245,'단화');
insert into MPRODUCT(Pname,Pcode,Id,price,brand,psize,category) 
values ('컨버스',mproduct_pcode_seq.nextval,'mina012',26000,'아디다스',280,'단화');
insert into MPRODUCT(Pname,Pcode,Id,price,brand,psize,category) 
values ('아디다스',mproduct_pcode_seq.nextval,'hongGD',80000,'아디다스',270,'워커');
insert into MPRODUCT(Pname,Pcode,Id,price,brand,psize,category) 
values ('워커',mproduct_pcode_seq.nextval,'sana',45000,'크록스',280,'워커');
insert into MPRODUCT(Pname,Pcode,Id,price,brand,psize,category) 
values ('슬리퍼',mproduct_pcode_seq.nextval,'twice',55000,'크록스',285,'슬리퍼');
insert into MPRODUCT(Pname,Pcode,Id,price,brand,psize,category) 
values ('아무거나',mproduct_pcode_seq.nextval,'twice',23000,'컨버스',230,'슬리퍼');
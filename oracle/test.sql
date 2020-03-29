select * from member;

select * from seller;

insert into member values ('test', '$2a$10$5qX86iTy90SpDRiSPgO7ve19uW90NQl.PQEvLFiIFwvmVkkZfKIMW', 'tester', '01033543929', 'nobil2474@naver.com', sysdate, 1);

insert into seller values ('test', 'test', 'test', 'test', 1, '14687', '경기 부천시 안곡로 105 명성홈타운 202호', 1234, '1234');

insert into bank values (1234, '1234');

select * from bank;

select * from category;

select * from product;

select * from optionn;

delete from member;

select * from orderr where "orderDate" = (select max("orderDate") from orderr where "id" = 'test');

select * from orderr;

select * from payCard;

select * from orderlist;

delete from orderr;

delete from payCard;


commit;

insert into category values (1, '의류', 1, 0);

insert into product values (1, '후드티', '후드티입니당', 100, '1', '1', 'FALSE', 100, 1, sysdate, 'test', '면', '은호모직', sysdate, '한국', 100, '상품', '색상', '사이즈');

insert into product values (2, '티', '티입니당', 100, '1', '1', 'FALSE', 100, 1, sysdate, 'test', '면', '은호모직', sysdate, '한국', 100, '상품', '색상', '');

delete from product where "productNum" = 2;

insert into OPTIONN values (OPTION_SEQ.NEXTVAL, 1, 5, 1, 3, 5);
insert into OPTIONN values (OPTION_SEQ.NEXTVAL, 1, 5, 1, 3, 6);
insert into OPTIONN values (OPTION_SEQ.NEXTVAL, 1, 5, 1, 4, 5);
insert into OPTIONN values (OPTION_SEQ.NEXTVAL, 1, 5, 1, 4, 6);
insert into OPTIONN values (OPTION_SEQ.NEXTVAL, 1, 5, 2, 3, 5);
insert into OPTIONN values (OPTION_SEQ.NEXTVAL, 1, 5, 2, 3, 6);
insert into OPTIONN values (OPTION_SEQ.NEXTVAL, 1, 5, 2, 4, 5);
insert into OPTIONN values (OPTION_SEQ.NEXTVAL, 1, 5, 2, 4, 6);

insert into OPTIONN values (OPTION_SEQ.NEXTVAL, 2, 5, 7, 9, 0);
insert into OPTIONN values (OPTION_SEQ.NEXTVAL, 2, 5, 7, 10, 0);
insert into OPTIONN values (OPTION_SEQ.NEXTVAL, 2, 5, 8, 9, 0);
insert into OPTIONN values (OPTION_SEQ.NEXTVAL, 2, 5, 8, 10, 0);

delete from OPTIONN;

drop sequence option_seq;

select * from DETAILOPTION;

delete from DETAILOPTION;

drop sequence DETAILOPTION_SEQ;

drop sequence ORDER_SEQ;

CREATE SEQUENCE DETAILOPTION_SEQ
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOMINVALUE
  NOCYCLE
  NOCACHE
;


CREATE SEQUENCE OPTION_SEQ
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOMINVALUE
  NOCYCLE
  NOCACHE
;

CREATE SEQUENCE ORDER_SEQ
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOMINVALUE
  NOCYCLE
  NOCACHE
;

insert into DETAILOPTION values (DETAILOPTION_SEQ.NEXTVAL, '그냥후드', 1, 1);  
insert into DETAILOPTION values (DETAILOPTION_SEQ.NEXTVAL, '기모', 1, 1);  
insert into DETAILOPTION values (DETAILOPTION_SEQ.NEXTVAL, '빨강', 2, 1);  
insert into DETAILOPTION values (DETAILOPTION_SEQ.NEXTVAL, '파랑', 2, 1);  
insert into DETAILOPTION values (DETAILOPTION_SEQ.NEXTVAL, 'L', 3, 1);  
insert into DETAILOPTION values (DETAILOPTION_SEQ.NEXTVAL, 'M', 3, 1);  

insert into DETAILOPTION values (DETAILOPTION_SEQ.NEXTVAL, '맨투맨', 1, 2);
insert into DETAILOPTION values (DETAILOPTION_SEQ.NEXTVAL, '쭉티', 1, 2);
insert into DETAILOPTION values (DETAILOPTION_SEQ.NEXTVAL, '빨강', 2, 2);
insert into DETAILOPTION values (DETAILOPTION_SEQ.NEXTVAL, '파랑', 2, 2);

SELECT * FROM DETAILOPTION WHERE "productNum" = 1;

SELECT "optionNum" FROM OPTIONN WHERE "productNum" = 1 and "optionOneNum" = 1 and "optionTwoNum" = 3 and "optionThreeNum" = 5;

commit;

SELECT MAX("optionLevel") FROM DETAILOPTION WHERE "productNum" = 2;

insert into ADMIN VALUES ('admin', '$2a$10$o8OCjxqC2tDcgTIZgcgMBeAWd0gsmHfnH4lMs7jv76J3/Ra43virm');
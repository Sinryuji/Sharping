insert into member values ('guest', '$2a$10$5qX86iTy90SpDRiSPgO7ve19uW90NQl.PQEvLFiIFwvmVkkZfKIMW', 'guest', '0', 'guest@guest.com', sysdate, 1, 'guest', 'guest', 'guest');

insert into category values (0, '임시', 0, 0);

insert into bank values (1, '신한은행');
insert into bank values (2, '국민은행');
insert into bank values (3, '기업은행');
insert into bank values (4, '우리은행');

--비밀번호 1234 입니다
insert into ADMIN VALUES ('admin', '$2a$10$o8OCjxqC2tDcgTIZgcgMBeAWd0gsmHfnH4lMs7jv76J3/Ra43virm');
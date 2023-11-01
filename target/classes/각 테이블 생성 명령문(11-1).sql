create table admin(
a_id varchar2(20) not null,
a_pw varchar2(100) not null,
a_name varchar2(20) not null,
a_p_number varchar2(20) not null,
a_email varchar2(50) not null,
a_authority varchar2(20) not null,
age varchar(20) not null,
gender varchar(20) not null,
a_regdate date default SYSDATE,
a_moddate date default SYSDATE
);

create table product(
p_no number(5) primary key,
p_name varchar2(100) not null,
p_type char(1),    -- 정장 : 1, 운동복 : 2, 수영복 : 3..
p_producer varchar2(50) not null,
p_size number(3) DEFAULT 90,
price number(7) default 0,
p_content varchar2(1000) default null,
stock  number(7) default 0,
sale char default 'y', -- 판매 : y, 판매중단 : n
regdate date default SYSDATE
);
create sequence product_seq start with 1 increment by 1; --상품 번호 생성

create table users(
u_id varchar2(20) primary key,
u_pw varchar2(100) not null,
u_name varchar2(20) not null,
u_p_number varchar2(20) not null,
u_email varchar2(50) not null,
u_address varchar2(100) not null,
age varchar(20) not null,
gender varchar(20) not null,
u_regdate date default SYSDATE,
u_moddate date default SYSDATE
);

create table member(
id varchar2(20) primary key,
pw varchar2(100) not null,
name varchar2(20) not null,
age varchar(20) not null,
gender varchar(20) not null,
p_number varchar2(20) not null,
email varchar2(50) not null,
address varchar2(100) not null,
authority varchar2(20),
regdate date default SYSDATE,
moddate date default SYSDATE
);

create table shoppingBasket(
b_no number(5) primary key,
u_id varchar2(20) not null,
p_no number(5) ,
quantity number(5) default 1,
b_regdate date default sysdate,
constraint fk_member_id foreign key(u_id) references member(id),
constraint fk_product_no foreign key(p_no) references product(p_no)
);
create sequence shoppingBasket_seq start with 1 increment by 1; --장바구니 번호 생성

create table productImage (
uuid varchar2(100) not null,
uploadPath varchar2(200) not null,
fileName varchar2(100) not null,
filetype char(1) default 'I',
p_no number(10,0)
);

alter table productImage add constraint pk_image primary key (uuid);

alter table productImage add constraint fk_product_image foreign key (p_no) references product(p_no);

create table orders(
    o_no number(10) primary key,
    o_id varchar2(20),
    o_regdate date default sysdate,
    constraint fk_order_id foreign key(o_id) references member(id)
    );
create sequence orders_seq start with 1 increment by 1; -- 주문번호 생성

insert into admin(a_id,a_pw,a_name,a_p_number,a_email,a_authority, age, gender) values ('admin0', 'pw0', 'admin0', '010-000-0000',
'admon@gmail.com', 'admin', '30', 'man');

insert into users(u_id,u_pw,u_name,u_p_number,u_email,u_address, age, gender) values ('user0', 'pw0', 'user0', '010-000-0000',
'user@gmail.com', '서울 어딘가', '24', 'woman');

insert into member(id,pw,name,p_number,email,address,authority, age, gender) values ('admin0', 'pw0', 'admin0', '010-000-0000',
'admon@gmail.com', 'USA', 'admin', '30', 'man');

insert into member(id,pw,name,p_number,email,address,authority, age, gender) values ('user0', 'pw0', 'user0', '010-000-0000',
'user@gmail.com', '서울 어딘가', 'user', '24', 'woman');

insert into product(p_no,p_name,p_type, p_producer,p_size,price,p_content,stock, sale)
values ('1', '연습상품', '1', '나이키', '100', '19800', '연습 제품', '30', 'y');

insert into shoppingBasket(b_no,u_id ,p_no,quantity)
values ('2', 'user0', '3', '10');

insert into orders(o_no,o_id)
values ('1', 'user0');



commit;
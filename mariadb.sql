-- member
create table Member2 (
                         mno int primary key auto_increment,
                         name varchar(20) not null,
                         jumin varchar(20) not null,
                         userid varchar(20) not null,
                         passwd varchar(20) not null,
                         zipcode varchar(10) not null,
                         addr1 varchar(50) not null,
                         addr2 varchar(50) not null,
                         email varchar(50) not null,
                         phone varchar(20) not null,
                         regdate timestamp default current_timestamp
);

-- CRUD
insert into Member2 (name, jumin, userid, passwd, zipcode, addr1, addr2,
                     email, phone) values (?,?,?,?,?,?,?,?,?);

-- board
create table Board (

    bno int primary key auto_increment,
    title varchar(100) not null,
    userid varchar(20) not null,
    regdate timestamp default current_timestamp,
    views int default 0,
    thumbs int default 0,
    contents text not null

);

-- CRUD
insert into Board (title, userid, contents) values ('Java좋아','seunghee','Java, Database, WEB3, Spring4 다 좋았다.');

select bno, title, userid, regdate, thumbs, views from Board order by bno desc;

select * from Board where bno = ?;

update Board set title = '~', contents = '~', regdate = current_timestamp
    where bno = ?;

delete from Board where bno = ?;

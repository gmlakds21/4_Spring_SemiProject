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


-- reply
create table Reply (
    rno int primary key auto_increment,
    cno int not null,
    bno int not null,
    reply text not null,
    userid varchar(20) not null,
    regdate timestamp default current_timestamp
);

alter table Reply add constraint fk_br
    foreign key (bno) references Board (bno);

insert into Reply (bno, rno, cno, reply, userid) value
    (309, 1, 1, '오늘은 날씨가...', 'user1'),
    (309, 4, 1, '비올것 같아요', 'user10'),
    (309, 6, 1, '블라블라', 'user9'),
    (309, 2, 2, '점심메뉴는', 'user2'),
    (309, 3, 3, '월요병이 도졌나 ...', 'user3'),
    (309, 5, 5, '블라블라', 'user25'),
    (309, 7, 7, '블라블라...', 'user23');

select bno, rno, cno, userid, reply from Reply
    where bno=309 order by cno;

-- 데이터 추가시 반영될 auto increment 값 조회
select auto_increment from information_schema.TABLES
    where TABLE_NAME = 'Reply';

insert into Reply (bno, cno, reply, userid) value
    (309, (select auto_increment from information_schema.TABLES
           where TABLE_NAME = 'Reply'), '블라블라...', 'user23');


select bno, rno, cno, userid, reply from Reply
    where bno=309 order by cno;


-- pds
create table Pds (
     pno int primary key auto_increment,
     title varchar(100) not null,
     userid varchar(20) not null,
     regdate timestamp default current_timestamp,
     views int default 0,
     thumbs int default 0,
     contents text not null,
     fname1 varchar(50),
     fname2 varchar(50),
     fname3 varchar(50),
     fsize1 varchar(5),
     fsize2 varchar(5),
     fsize3 varchar(5),
     ftype1 varchar(5),
     ftype2 varchar(5),
     ftype3 varchar(5),
     fdown1 int default 0,
     fdown2 int default 0,
     fdown3 int default 0
);

-- CRUD
insert into Pds (title, userid, contents, fname1, fname2, fname3, fsize1, fsize2, fsize3,
                 ftype1, ftype2, ftype3)
    values (?,?,?,?,?,?,?,?,?,?,?,?);

select pno, title, userid, regdate, thumbs, views from Pds
    order by pno desc;

select * from Pds where pno = ?;

create table Pds (
                     pno int primary key auto_increment,
                     title varchar(100) not null,
                     userid varchar(20) not null,
                     regdate timestamp default current_timestamp,
                     views int default 0,
                     thumbs int default 0,
                     contents text not null,
                     fname1 varchar(50),
                     fname2 varchar(50),
                     fname3 varchar(50),
                     fsize1 varchar(5),
                     fsize2 varchar(5),
                     fsize3 varchar(5),
                     ftype1 varchar(5),
                     ftype2 varchar(5),
                     ftype3 varchar(5),
                     fdown1 int default 0,
                     fdown2 int default 0,
                     fdown3 int default 0,
                     uuid varchar(20)
);

select fname1 fname1, uuid from Pds where pno=2;
select fname2 fname1, uuid from Pds where pno=2;
select fname3 fname1, uuid from Pds where pno=2;

update Pds set ftype1 = lower(ftype1), ftype2 = lower(ftype2), ftype3 = lower(ftype3);


-- gallery

create table Gallery (
                     gno int primary key auto_increment,
                     title varchar(100) not null,
                     userid varchar(20) not null,
                     regdate timestamp default current_timestamp,
                     views int default 0,
                     thumbs int default 0,
                     contents text not null,
                     fnames varchar(1000),
                     fsizes varchar(1000),
                     uuid varchar(20)
);

insert into Gallery (title, userid, contents, fnames, fsizes, uuid)
    value (?,?,?,?,?,?);

select gno, title, userid, regdate, views, thumbs from Gallery
    order by gno desc;

select * from Gallery where gno = ?;
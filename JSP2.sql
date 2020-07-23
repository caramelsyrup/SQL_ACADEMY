CREATE TABLE member(
 userID VARCHAR2(50) PRIMARY key,
 userName VARCHAR2(50),
 userPwd VARCHAR2(50),
 userEmail VARCHAR2(70),
 userTel NUMBER,
 admin number
);

COMMIT;
ALTER TABLE member MODIFY userTel VARCHAR2(70);

select * from member;

SELECT COUNT(userid) AS COUNT FROM member;

select * from board;
select * from board order by num desc;
delete from board;
commit;
SELECT * FROM board WHERE WRITER LIKE '%³ª%';
CREATE SEQUENCE BOARD_SEQ;

CREATE TABLE commentboard (
cnum number CONSTRAINT commentboard_cnum_pk PRIMARY KEY,
userid VARCHAR2(20),
regdate VARCHAR2(20) DEFAULT sysdate,
msg VARCHAR2(1000),
bnum NUMBER
);

ALTER TABLE commentboard ADD CONSTRAINT commentboard_bnum_fk
   FOREIGN KEY (bnum) REFERENCES board (num);

CREATE SEQUENCE commentboard_seq;
delete from commentboard;
commit;
select * from commentboard;
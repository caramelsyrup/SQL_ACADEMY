CREATE TABLE guestbook(
    num NUMBER  PRIMARY KEY,
    writter VARCHAR2(50),
    content VARCHAR2(200),
    grade VARCHAR2(20),
    created VARCHAR2(20) default sysdate,
    ipaddr VARCHAR2(20)
);

CREATE SEQUENCE guestbook_seq minvalue 1 start with 1 nocache nocycle INCREMENT by 1;

SELECT * FROM  guestbook;
SELECT COUNT(NUM) FROM guestbook;
delete from guestbook;
commit;
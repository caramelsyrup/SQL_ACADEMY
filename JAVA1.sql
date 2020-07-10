-- 자바시간, 테이블과 시퀀스 생성.
CREATE TABLE player(
    num number PRIMARY KEY,
    name VARCHAR2(30),
    birth VARCHAR2(20),
    height number(5,2),
    weight number(5,2),
    kind VARCHAR2(30)
);
DESC player;
DROP SEQUENCE player_seq;

CREATE SEQUENCE player_seq START WITH 1 INCREMENT BY 1 NOCACHE;

COMMIT;

CREATE TABLE friend(
    num number PRIMARY key,
    name VARCHAR2(50),
    birth VARCHAR2(20),
    phone VARCHAR2(20),
    addr VARCHAR2(100)
);

CREATE SEQUENCE firend_seq START WITH 1;

SELECT * FROM friend;
-- ---------------------------------------------------------------------------

CREATE TABLE member(
    account VARCHAR2(50) UNIQUE CHECK(LENGTH(account)between 5 and 10),
    password number CHECK(LENGTH(password)between 4 and 8),
    name VARCHAR2(50) NOT NULL,
    birth VARCHAR2(30) NOT NULL,
    city VARCHAR2(30),
    phone VARCHAR2(50),
    email VARCHAR2(50)
);
DROP TABLE member;
DROP TABLE SCHEDULE;

SELECT * FROM member;

CREATE TABLE SCHEDULE (
    AIRLINE VARCHAR2(50) NOT NULL,
    DEP VARCHAR2(40) NOT NULL,
    ARR VARCHAR2(40) NOT NULL,
    YEAR NUMBER,
    MONTH NUMBER
);
SELECT * FROM member;
SELECT * FROM SCHEDULE;
SELECT airline,dep,arr,year,month FROM schedule;

INSERT INTO schedule VALUES ('KOREAN_AIR','SEOUL','TOKYO',2020,9);
INSERT INTO schedule VALUES ('ASIAN_AIR','BUSAN','BEIJING',2020,12);
INSERT INTO schedule VALUES ('BUSAN_AIR','SEOUL','TAIWAN',2021,11);
commit;

CREATE TABLE RESERVATION(
    account VARCHAR2(40),
    name VARCHAR2(40),
    airline VARCHAR2(40),
    dep VARCHAR2(40),
    arr varchar2(40),
    year number,
    month number
);
commit;

select * from reservation;
-- -------------------------------------------------------------------------
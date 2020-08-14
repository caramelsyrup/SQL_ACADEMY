CREATE TABLE member(
    num NUMBER,
    userid VARCHAR2(50) PRIMARY KEY,
    userpwd VARCHAR2(50),
    useraddr VARCHAR2(800),
    usertel VARCHAR2(50),
    useremail VARCHAR2(80)
    );

ALTER TABLE member ADD (userzipcode VARCHAR(20));
ALTER TABLE member ADD (username VARCHAR(20));
COMMIT;   

CREATE SEQUENCE member_seq NOCACHE;

SELECT * FROM member;
SELECT * FROM member WHERE userid = 'admin';

INSERT INTO member VALUES (member_seq.nextval,'admin','1111','부산시','000-0000-0000','admin@admin.com',1,'000-000','관리자');

CREATE TABLE address(
zipcode VARCHAR2(20),
sido VARCHAR2(10),
gugun VARCHAR2(20),
dong VARCHAR2(200),
bunji VARCHAR2(100)
);

CREATE TABLE artworks(
artid NUMBER,
arttitle VARCHAR2(50) PRIMARY KEY,
artmaker VARCHAR2(40),
artdescription VARCHAR2(100)
);
CREATE SEQUENCE artworks_seq NOCACHE;
ALTER TABLE artworks ADD (filename VARCHAR(20));
SELECT * FROM artworks;

insert into artworks values(artworks_seq.nextval,'김정희 초상화','이한철','조선후기 초상화','kimjeonghee.jpg');

CREATE TABLE events(
eventnum NUMBER PRIMARY KEY,
eventname VARCHAR2(50),
eventhost VARCHAR2(50),
eventsche DATE DEFAULT SYSDATE,
eventlocation VARCHAR2(50),
eventdescip VARCHAR2(70)
);
CREATE SEQUENCE events_seq NOCACHE;
ALTER TABLE events ADD (filename VARCHAR(20));
SELECT * FROM events;

CREATE TABLE reservation (
renum NUMBER,
userid VARCHAR2(50),
eventname VARCHAR2(50),
eventlocation VARCHAR2(50),
eventsche DATE DEFAULT SYSDATE,
quantity number
);
CREATE SEQUENCE reservation_seq NOCACHE;
SELECT * FROM reservation;

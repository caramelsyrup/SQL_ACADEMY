CREATE TABLE member(
 userID VARCHAR2(50) PRIMARY key,
 userName VARCHAR2(50),
 userPwd VARCHAR2(50),
 userEmail VARCHAR2(70),
 userTel NUMBER,
 admin number
);
drop table member;

DELETE FROM member;

ALTER TABLE member MODIFY userTel VARCHAR2(70);
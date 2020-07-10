CREATE TABLE address(
    num number CONSTRAINT address_num_pk PRIMARY KEY,
    name VARCHAR2(30),
    zipcode VARCHAR2(20),
    address VARCHAR2(70),
    tel VARCHAR2(50)
);
CREATE SEQUENCE address_seq;
desc address;

select * from address;
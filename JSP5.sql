CREATE TABLE TBL_BOARD(
    NUM NUMBER PRIMARY KEY,
    writter VARCHAR2(50),
    content VARCHAR2(1000),
    subject VARCHAR2(100),
    reg_date VARCHAR2(20),
    readcount NUMBER
    );
    
CREATE SEQUENCE TBL_BOARD_SEQ START WITH 1 NOCACHE;

SELECT * FROM TBL_BOARD;

SELECT rownum FROM TBL_BOARD;
SELECT * FROM 
    (SELECT aa.* , rownum rn FROM
        (SELECT * FROM TBL_BOARD ORDER BY num DESC) aa 
            WHERE rownum<=7) WHERE rn >= 4;
            
CREATE TABLE commenttable(
    CNUM NUMBER PRIMARY KEY,
    USERID VARCHAR2(20),
    MSG VARCHAR2(500),
    REGDATE VARCHAR2(20),
    BNUM NUMBER
    );
CREATE SEQUENCE commenttable_seq;
delete from TBL_BOARD where num = 23;
commit;
SELECT * FROM commenttable;
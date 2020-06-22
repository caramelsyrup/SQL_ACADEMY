SELECT
    TABLE_NAME AS "테이블명",
    INDEX_NAME AS "인덱스이름",
    COLUMN_NAME AS "컬럼이름"
FROM ALL_IND_COLUMNS                    -- 오라클에서 자동으로 생성하는 테이블.
WHERE TABLE_NAME = 'DEPARTMENTS';       -- 테이블이름을 대문자로
-- DEPT_ID_PK인 기본키의 것 생성., DEPT_LOCATION_IX 외래키인 것 또한 생성. 2개의 인덱스 생성.
DROP TABLE MEMBERS;
-- 실습으로 테이블 만들기
CREATE TABLE MEMBERS  (
    MEMBER_ID NUMBER,
    FIRST_NAME VARCHAR2(100) NOT NULL,
    LAST_NAME VARCHAR2(100) NOT NULL,
    GENDER CHAR(1) NOT NULL,
    DOB DATE NOT NULL,
    EMAIL VARCHAR2(255) NOT NULL,
    PRIMARY KEY(MEMBER_ID)
);

SELECT
    TABLE_NAME AS "테이블명",
    INDEX_NAME AS "인덱스이름",
    COLUMN_NAME AS "컬럼이름"
FROM ALL_IND_COLUMNS                    
WHERE TABLE_NAME = 'MEMBERS';

SELECT * FROM MEMBERS WHERE last_name = 'Harse';        -- 테이블 전체를 검색

EXPLAIN PLAN FOR                                        -- 다음 나오는 select문을 실행하여, 보고서 작성.
SELECT * FROM members WHERE last_name = 'Harse';

SELECT PLAN_TABLE_OUTPUT                                 -- 설명문을 출력
FROM TABLE (DBMS_XPLAN.DISPLAY());

-- 인덱스 만들기
CREATE INDEX MEMBERS_LAST_NAME_I ON MEMBERS(LAST_NAME);

-- 인덱스 삭제하기
DROP INDEX MEMBERS_LAST_NAME_I;

SELECT * FROM members WHERE first_name LIKE 'M%' AND last_name LIKE 'A%';

-- 멀티 인덱스 만들기
CREATE INDEX NAME_I
ON MEMBERS(FIRST_NAME, LAST_NAME);
-- 성능평가 ( 이론적 )
EXPLAIN PLAN FOR                                        -- 다음 나오는 select문을 실행하여, 보고서 작성.
SELECT * FROM members 
WHERE first_name LIKE 'M%' AND last_name LIKE 'A%';
SELECT PLAN_TABLE_OUTPUT                                 -- 설명문을 출력
FROM TABLE (DBMS_XPLAN.DISPLAY());

-- 인덱스 삭제하기
DROP INDEX NAME_I;
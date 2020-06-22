-- 제약조건의 추가 및 수정
CREATE TABLE class(
    cno VARCHAR2(2),
    cname VARCHAR2(50)
);  -- 테이블 생성.

INSERT INTO class VALUES ('01', '데이터베이스');
INSERT INTO class VALUES ('02', '자바');
SELECT * FROM class;

-- 학생 테이블 생성
CREATE TABLE student(
    sno VARCHAR2(4),
    sname VARCHAR2(50),
    cno VARCHAR2(2)
);  -- cno 외래키.
DELETE FROM student;
INSERT INTO student VALUES ('0414', 'hong','01');
INSERT INTO student VALUES ('0415', 'im','02');
INSERT INTO student VALUES ('0416', 'lee','03');
COMMIT;
SELECT * FROM STUDENT;

-- 제약조건 추가, class테이블에 기본키 추가.
ALTER TABLE class                                -- class테이블 수정
ADD CONSTRAINT class_cno_pk PRIMARY KEY(cno);   -- 추가 제약조건.
-- class 테이블에 기본키 추가
INSERT INTO class VALUES ('01', '데이터베이스'); -- 에러가 뜨는데, 이미 01이 있기에, null을 넣어도 에러가 뜬다.
-- class 테이블에 유니크 키 추가
ALTER TABLE class
ADD CONSTRAINT class_cname_uk UNIQUE(cname);
INSERT INTO class VALUES ('03', '데이터베이스'); -- 03은 기본키 조건은 만족하나 cname에서 중복 에러가 발생.

-- 제약조건을 조회
SELECT *FROM ALL_CONSTRAINTS    -- 제약조건은 ALL_CONSTRAINTS의 테이블에 저장되어 있음.
WHERE table_name = 'CLASS';     -- 테이블 이름을 제대로 적으면 조회 가능. 대문자 구분.
SELECT *FROM ALL_CONSTRAINTS 
WHERE table_name = 'DEPARTMENTS';

-- student 테이블에 기본키 추가
ALTER TABLE student
ADD CONSTRAINT student_sno_pk PRIMARY KEY(sno);
-- NOT NULL 제약조건 추가시 MODIFY 사용.
ALTER TABLE student
MODIFY sname CONSTRAINT student_sname_nn NOT NULL;
-- student 테이블 외래키 추가
ALTER TABLE student
ADD CONSTRAINT student_sno_fk FOREIGN KEY(cno) -- 외래키 추가
REFERENCES class (cno);                         -- class테이블의 cno를 참조.

SELECT*FROM class;          -- cno가 2개
SELECT*FROM student;         -- cno가 3개. 매칭이 안되면 에러가 남.

UPDATE student SET cno = '01'
WHERE sno = '0416';         -- cno를 바꾸기 위해서 문제가 되는 행을 찾아서 변경한다.

-- 제약조건의 삭제

-- 제약조건의 이름으로 삭제
ALTER TABLE class
    DROP CONSTRAINT class_cno_pk CASCADE;   -- 참조받는 fk가 존재하기에, CASCADE 옵션을 사용해야함.

-- 제약조건으로 삭제
ALTER TABLE class
    DROP UNIQUE (cname);                -- UNIQUE 설정되어 있는 cname의 제약도 삭제.
ALTER TABLE student
    DROP PRIMARY KEY;                   -- PRIMARYKEY 제약조건도 삭제.

-- 테이블의 삭제
DROP TABLE class;
DROP TABLE student;

-- 테이블 컬럼(열)의 추가/삭제

-- 90번 부서의 직원들을 새테이블 E_EMP에 입력

CREATE TABLE E_EMP AS                               -- 열의 이름은 가져오는 테이블의 것 사용.
SELECT employee_id,last_name, salary, department_id
FROM employees WHERE department_id = 90;

CREATE TABLE E_EMP2(EMP_ID, NAME, SAL, DEPT_ID) AS  -- 열의 이름을 따로 지정 생성.
SELECT employee_id,last_name, salary, department_id
FROM employees WHERE department_id = 90;

SELECT * FROM E_EMP;

-- 열의 추가
ALTER TABLE E_EMP ADD (GENDER VARCHAR2(1)); -- GENDER 열을 추가 함.
-- DEFAULT 값을 0으로 하는 열 추가
ALTER TABLE E_EMP ADD (커미션 NUMBER DEFAULT 0 NOT NULL);  -- NULL 대신 0이 입력.
-- 두개의 열 추가
ALTER TABLE E_EMP ADD (날짜 DATE DEFAULT SYSDATE, 제작자 VARCHAR2(100) DEFAULT USER);

-- 열의 수정
-- 데이터 사이즈 수정
ALTER TABLE E_EMP
MODIFY (제작자 VARCHAR2(200)); -- 100에서 200으로 변경 함.

DESC E_EMP;     -- 열의 이름과 데이터 유형 확인.

ALTER TABLE E_EMP
MODIFY (제작자 VARCHAR2(50));  -- 200에서 50으로 변경.

ALTER TABLE E_EMP
MODIFY (제작자 VARCHAR2(1)); -- 1로 변경시 에러가 난다. 현재 2BYTE 내용이 기입되어 있음.

ALTER TABLE E_EMP
MODIFY (제작자 NUMBER);      -- 이미 문자형데이터가 입력된 상태라서, 숫자형으로 변경 불가능.

SELECT * FROM E_EMP;

ALTER TABLE E_EMP
MODIFY (GENDER NUMBER);     -- GENDER열에는 값이 없기때문에, 데이터 형식을 바꿀 수 있음.

UPDATE E_EMP SET 제작자 = NULL;
COMMIT;

-- 열을 삭제
ALTER TABLE E_EMP
DROP COLUMN 제작자;         -- 해당 열 하나만 삭제.
-- 여러개의 열을 삭제
ALTER TABLE E_EMP
DROP (GENDER,커미션,날짜);   -- 열들의 이름을 나열.

-- 열의 이름 수정
ALTER TABLE E_EMP
RENAME COLUMN DEPARTMENT_ID TO 부서번호;        -- 현재 열이름 TO 바꿀이름
ALTER TABLE E_EMP
RENAME COLUMN SALARY TO 급여;
ALTER TABLE E_EMP
RENAME COLUMN EMPLOYEE_ID TO 직원번호;
ALTER TABLE E_EMP
RENAME COLUMN LAST_NAME TO 이름;

-- 테이블의 이름 변경
RENAME E_EMP TO 직원테이블;

-- 테이블 생성
CREATE TABLE stmans(id,job,sal) AS
SELECT employee_id,job_id,salary FROM employees WHERE job_id = 'ST_MAN';

desc stmans;
select * from stmans;
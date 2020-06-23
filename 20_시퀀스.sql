-- 시퀀스
-- 시퀀스 생성
CREATE SEQUENCE 시퀀스1; -- 생성
DROP SEQUENCE 시퀀스1;   -- 삭제

-- 시퀀스이름으로 시퀀스 정보 조회
SELECT * FROM USER_SEQUENCES WHERE SEQUENCE_NAME = '시퀀스1';

-- 시퀀스 테스트 듀얼 테이블에서
SELECT 시퀀스1.NEXTVAL FROM DUAL;      -- 시퀀스이름.NEXTVAL // 실행하는 만큼 수치가 증가함.
SELECT 시퀀스1.CURRVAL FROM DUAL;      -- 시퀀스의 현재값( 값을 증가시키지 않고 )

-- 시퀀스 테스트 테이블 생성
CREATE TABLE 부서_테스트 (
    부서번호 NUMBER PRIMARY KEY,
    부서이름 VARCHAR2(100) NOT NULL
);

INSERT INTO 부서_테스트 VALUES (시퀀스1.NEXTVAL, '영업부');    -- 부서번호를 시퀀스를 이용해서 입력.
INSERT INTO 부서_테스트 VALUES (시퀀스1.NEXTVAL, '개발부');    -- NEXTVAL은 실행될떄마다 1씩 증가 하기에,
INSERT INTO 부서_테스트 VALUES (시퀀스1.NEXTVAL, '회계부');    -- 부서번호에 대한 고민이 적어짐.
COMMIT;
SELECT * FROM 부서_테스트;

-- 시퀀스 옵션 사용
-- 시퀀스2 생성, 시작값을 10, 증가값을 20
CREATE SEQUENCE 시퀀스2           -- 시퀀스2를 생성.
START WITH 10 INCREMENT BY 20;   -- 스타트는 10에서, 증가는 20씩.

DELETE FROM 부서_테스트;     -- 모든 행을 삭제. 테이블은 존재.
INSERT INTO 부서_테스트 VALUES (시퀀스2.NEXTVAL, '영업부');    -- 시퀀스2는 첫시작이 10
INSERT INTO 부서_테스트 VALUES (시퀀스2.NEXTVAL, '개발부');    -- 다음 실행에서는 20씩 증가.
INSERT INTO 부서_테스트 VALUES (시퀀스2.NEXTVAL, '회계부');
INSERT INTO 부서_테스트 VALUES (시퀀스2.NEXTVAL, '홍보부');
INSERT INTO 부서_테스트 VALUES (시퀀스2.NEXTVAL, '교육부');    -- 부서번호가 90번
COMMIT;
SELECT * FROM 부서_테스트;

-- 시퀀스1로 부서번호를 업데이트
UPDATE 부서_테스트 SET 부서번호 = 시퀀스1.NEXTVAL;
-- 테이블을 삭제.
DROP TABLE 부서_테스트;
DROP SEQUENCE 시퀀스1; -- 테이블이 삭제가 되어도 시퀀스는 남아 있기 때문에
DROP SEQUENCE 시퀀스2;

DROP TABLE DEPT CASCADE CONSTRAINTS;    -- 제약조건도 같이 삭제하는 명령어.
DROP TABLE EMP CASCADE CONSTRAINTS;
DROP TABLE EMP1 CASCADE CONSTRAINTS;
DROP TABLE EMP2 CASCADE CONSTRAINTS;
DROP TABLE E_EMP2 CASCADE CONSTRAINTS;
DROP TABLE EX_DATE CASCADE CONSTRAINTS;
DROP TABLE 직원테이블 CASCADE CONSTRAINTS;
DROP TABLE STMANS CASCADE CONSTRAINTS;
DROP TABLE MEMBERS CASCADE CONSTRAINTS;


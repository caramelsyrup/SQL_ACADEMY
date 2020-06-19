-- 문자형
-- 문자형 char와 varchar2 비교
CREATE TABLE comp (
    char_col char(4),
    varchar_col varchar2(4));
    -- CHAR는 고정, VARCHAR2는 변동.
INSERT INTO comp VALUES ('AA','AA');        -- 4바이트 : 2 바이트
INSERT INTO comp VALUES ('AAA','AAA');      -- 4바이트 : 3 바이트
INSERT INTO comp VALUES ('AAAA','AAAA');    -- 4바이트 : 4 바이트
COMMIT;

SELECT*FROM comp;
SELECT*FROM comp WHERE char_col = varchar_col;  -- 4바이트끼리만 나옴.

-- 숫자형 데이터 타입 NUMBER
--  NUMBER(P,S) : P는 유효자리수1~38, S는 소수점 유효자리수

-- DATE 타입
SELECT hire_date,TO_CHAR(hire_date,'YYYY-MM-DD') FROM employees;

SELECT * FROM employees WHERE hire_date<'2002/03/03'; -- 왼쪽 데이터형과 오른쪽 문자형이 자동으로 비교 가능.


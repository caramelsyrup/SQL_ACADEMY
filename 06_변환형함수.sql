-- 변환형 함수
-- TO_CHAR, 숫자를 문자로 변환
-- ,(콤마)
SELECT TO_CHAR(123456789,'999,999,999') FROM DUAL; -- TO_CHAR는 왼쪽에 숫자, 오른쪽에 출력할 문자의 형식을 적어줌.
-- .(소수점)
SELECT TO_CHAR(123465789.1245,'999,999,999.99') FROM DUAL; -- 소수점 두자리까지 형식을 정해 놓아서, 두자리까지 반올림하여 출력.
-- $표시
SELECT TO_CHAR(123456789,'$999,999,999') FROM DUAL;     -- 달러표시
-- 다른 통화
SELECT TO_CHAR(132465789,'L999,999,999') FROM DUAL;     -- L을 쓰면 현지 통화가 출력이 된다.
-- 왼쪽에 0을 삽입
SELECT TO_CHAR(123,'09999') FROM DUAL;                  -- 남는 자리수에 0을 붙여준다. 5자리중 3자리만 기입되어서 00이 붙음.

-- 날짜를 문자로 변환. 
-- 년, 월, 일, 시, 분, 초
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS') FROM DUAL;    -- (현재 날짜와 시간, 출력되는 형식) 작성.
-- 165일 중 오늘이 몇일?
SELECT TO_CHAR(SYSDATE,'DDD') FROM DUAL;                       -- 올해 년도 중에서 오늘이 몇일째 되는지를 출력.
-- 오늘의 월 ?
SELECT TO_CHAR(SYSDATE,'MONTH') FROM DUAL;
-- 예제.
SELECT
    employee_id, TO_CHAR(hire_date,'YYYY/MM')AS "입사 월"
FROM employees WHERE department_id = 100;

SELECT
 first_name||' '||last_name AS "이름" , 
 TO_CHAR (salary,'$999,999,999.99') AS "월급"
FROM employees WHERE salary>10000 ORDER BY "월급" DESC;

-- TO_DATE, 문자를 날짜로 변환 ( CHAR, VARCHAR2 형을 DATE로 변환 )
SELECT TO_DATE('2011-01-01', 'YYYY-MM-DD') FROM DUAL;   -- 시간은 설정되어 있지 않음.

-- TO_NUMBER, 문자를 숫자로 변환
SELECT TO_NUMBER('999') + 100 FROM DUAL;        -- CHAR VARCHAR2 타입을 숫자형으로 변환.





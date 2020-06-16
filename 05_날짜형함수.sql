--날짜형 함수
SELECT first_name, hire_date FROM employees;

--SYSDATE 현재 날짜와 시간
SELECT SYSDATE FROM DUAL;

-- 날짜 + 숫자 --> 날짜
SELECT SYSDATE -3, SYSDATE, SYSDATE + 3 FROM DUAL;

-- 날짜 - 날짜 = 총 일수
SELECT employee_id, SYSDATE, hire_date, 
SYSDATE - hire_date, ROUND(SYSDATE-hire_date,0) -- 시간떄문에 소숫점까지 출력이 되기에, 반올림 해버림.
FROM employees;

-- 시간계산
SELECT SYSDATE + 5/24 FROM DUAL;    -- 5/24는 24 시간 중에서 5시간의 의미이고, 이문장은 5시간을 더한것.

-- MONTHS_BETWEEN = 월을 계산
SELECT employee_id, first_name, 
ROUND(MONTHS_BETWEEN(SYSDATE,hire_date),0), -- 달계산 또한 소수점이 나올수 있기에 반올림.
ROUND((SYSDATE - hire_date)/30,0)              -- 일계산에 30을 나눠서 달계산
FROM employees;

-- ADD_MONTHS = 달을 더함.
SELECT employee_id, first_name, hire_date,
    add_MONTHS(hire_date, 4)                -- 4달을 더함.
FROM employees;

-- NEXT_DAT(날짜, 다음번 나올 요일)
SELECT SYSDATE, NEXT_DAY(SYSDATE, '월요일') FROM DUAL; -- SYSDATE에서 다음주 월요일이 출력이 됨.

-- LAST_DAY(날짜) 해당 일이 속하는 달의 말일.
SELECT LAST_DAY(SYSDATE) FROM DUAL;             -- 6월의 마지막 날이 출력.

-- 날짜의 반올림
SELECT employee_id, hire_date ,
    ROUND(hire_date, 'MONTH') AS "월",   -- 월로 반올림을 하여 15일이 안넘어갔기에,  해당월 1일로, 넘어가면, 다음월 1일로 출력.
    ROUND(hire_date,'YEAR') AS "년"      -- 년으로 반올림을 하기에, 6월이 넘어 갔느냐 안넘어갔느냐가 기준. 다음년도 1월1일이 되어버림.
FROM employees WHERE MONTHS_BETWEEN(SYSDATE, HIRE_DATE) < 150;

--예제
SELECT
 SYSDATE, hire_date, ROUND(MONTHS_BETWEEN(SYSDATE,hire_date))AS "기간월" -- 사이의 개월수를 센다. 소수점으로 나옴.
FROM employees WHERE department_id = 100;

SELECT ADD_MONTHS(hire_date,-3)AS"3개월차감", hire_date, add_MONTHS(hire_date,3)AS "3개월추가"
-- ADD_MONTHS를 이용해서 달을 더하거나 뺀다.
FROM employees WHERE employee_id BETWEEN 100 AND 106;


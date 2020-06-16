-- 문자형 함수는 대소문자 함수와 문자조작 함수로 나뉜다.
-- 1. 대소문자 조작함수 ( upper, lower, initcap )
SELECT 1+1 FROM DUAL;   -- DUAL은 연습용 공백 테이블
SELECT LOWER('SQL COURSE') AS "소문자" , UPPER('SQL COURSE')AS "대문자", INITCAP('SQL COURSE')AS "첫문자만" FROM DUAL;

-- 문자형 함수를 WHERE절에 사용
SELECT * FROM employees WHERE UPPER(first_name) = 'PATRICK'; -- first_name의 데이터를 대문자로 변환하고 PATRICK과 비교.

-- 2. 문자조작 함수
-- CONCAT
SELECT first_name, last_name, CONCAT(first_name,last_name) AS "FULL NAME" FROM employees;

-- SUBSTR ( 열이름, M,N) M은 시작문자, N은 잘라낼 길이.
SELECT employee_id, first_name, 
SUBSTR(first_name,1,3), SUBSTR(first_name,2,4), -- 시작위치, 잘라내는 개수.
SUBSTR(first_name,2), -- 2번쨰부터 끝까지
SUBSTR(first_name,-3) -- -3이면 끝에서 3개까지 잘라낸다. 마이너스부호는 문자의 끝에서부터 시작.
FROM employees;

-- LENGTH 문자열 길이
SELECT first_name, LENGTH(first_name) FROM employees; -- first_name의 문자열개수 (길이)를 알려줌.

-- INSTR(문자열, 찾을 문자, M, N) M은 검사 시작위치, N은 중복문자의 위치(2이면 2번째 동일문자). 디폴트시 M,N은 1
SELECT first_name, 
INSTR(first_name,'e', 2),   -- 4번째
INSTR(first_name,'e', 5),   -- 7번째
INSTR(first_name,'e', 1,2)  -- 7번째 첫번째 e는 4번쨰지만, 2라고 지정했기에 2번째 e인 7번쨰를 찾는다.
FROM employees WHERE first_name = 'Nanette';


-- lpad / rpad (문자열, 자릿수, 채울문자)
SELECT employee_id, first_name, salary, 
LPAD(salary,10,'#'), -- 왼쪽에 #을 채우는데, 전체 문자열 길이가 10개가 되도록.
RPAD(salary,15, '*')  -- 오른쪽에 *을 채우는데, 전체 문자열 길이가 15개가 되도록.
FROM employees;

-- 공백을 이용해 문자열을 분리
SELECT 'HONG GILDONG' AS "성명", 
SUBSTR('HONG GILDONG',1,INSTR('HONG GILDONG',' ')-1) -- SUBSTR로 문자열을 INSTR로 문자열의 ' '을 기준으로 검사하여 추출.HONG추출
FROM DUAL;

SELECT '홍홍 길동' AS "NAME",
SUBSTR('홍홍 길동',INSTR('홍홍 길동',' ')+1)    -- INSTR이 3에다가 1을 더해서 4가 된다. SUBSTR을 통해서 문자열의 4번째부터 끝까지.
FROM DUAL;

--예제
SELECT last_name,CONCAT('Title is ',job_id ) FROM employees WHERE LOWER(SUBSTR(job_id,4,3)) = 'rep';
SELECT CONCAT(first_name,last_name) AS "FULL NAME" , last_name, 
LENGTH(last_name) AS "길이", 
INSTR(last_name, 'a') AS "a가 몇번쨰?"
FROM employees;

-- 3. 문자 치환 함수 (REPLACE)
SELECT
    job_id, REPLACE(job_id,'ACCOUNT','ACCNT') AS "치환" -- ACCOUNT 를 ACCNT로 치환(변경)
FROM employees WHERE job_id LIKE '%ACCOUNT%';

-- 예제.
SELECT
    last_name AS "이름",LOWER(last_name)AS "소문자",UPPER(last_name) AS "대문자",
    CONCAT(email,'@company.com')AS "이멜",INITCAP(email) AS "첫문자 대문자"
FROM employees;

SELECT
    job_id, SUBSTR(job_id,1,2) AS "첫 2개문자"
FROM employees;



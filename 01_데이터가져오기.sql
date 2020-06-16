-- 한줄의 주석 처리. 컨트롤키+/ , /* 여러줄 주석 */

-- 1. 테이블의 모든 행과 열을 읽어오기
SELECT * FROM departments;
-- 2. 특정 열만 읽어오기
SELECT department_id, department_name from departments;
SELECT department_id 부서번호 , location_id AS "*지역*번호" FROM departments;
-- AS를 써서 해당 열의 별칭 설정. " "는 특수문자사용시 사용.
-- 3. 산술 연산자 사용( +, -, *, / )
SELECT employee_id, first_name, salary from employees;
SELECT employee_id, first_name, salary, salary+100 as "덧셈연산", salary+(salary*0.1) as "곱,덧셈 연산" from employees;
-- 4. Null이란? 입력되지 않은, 사용가능하지 않은, 알수 없는 값. 0(zero), 공백("")과는 다른 개념.
SELECT last_name, job_id, salary, commission_pct from employees;
SELECT last_name, job_id, salary, commission_pct, commission_pct+10 from employees;
-- null값은 연산이 되지 않음. null값 제외하고 연산이 되어 버림.
-- 5. 중복된 값 제거 : distinct
SELECT DISTINCT job_id FROM employees;  
-- employees테이블에서 job id는 19개이다. 전체 조회시에는 중복도 같이 출력되지만 distinct로 제거.

-- 예제1.
SELECT employee_id, first_name, last_name from employees;
-- 예제2.
SELECT first_name, salary, salary*1.1 AS "new salary" from employees;
-- 예제3.
SELECT employee_id AS 사원번호 , first_name AS 이름, last_name AS 성 from employees;

-- 6. 연결 연산자(||)
SELECT last_name||' is a '||job_id AS "직업 정보"  FROM employees;
-- 테이블의 열끼리도 연결, 문자열과도 연결 가능.
SELECT employee_id, first_name||' '||last_name AS "FULL NAME" from employees;

--예제4.
SELECT employee_id, first_name||'_'||last_name AS "FULL NAME", email||'@company.com' FROM employees;

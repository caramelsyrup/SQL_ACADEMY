-- 1.테이블의 모든 데이터 가져오기
SELECT * FROM employees;
-- 2.where 절에 가져올 행을 선택.
-- 위치는 FROM 절 다음에 위치
SELECT * FROM employees WHERE department_id = 90;   -- 직원테이블전체에서 department_id가 90인 것만 추출.
SELECT * FROM employees WHERE salary = 24000;   -- 직원테이블에서 salary가 24000인 것만 추출.
/*  WHERE 절 사용시 주의 점. 문자와 날짜는  값은 항상 작은 따옴표로 표시.
    문자 값은 대소문자를 구분한다.( Case-Sensitive)
    날짜 값은 날짜 포맷에 벗어나지 않도록 (Format-Sensitive)
    오라클의 날짜 포맷은 RR/MM/DD (RR은 2자리 년도)
*/
-- 3.WHERE + 문자열
SELECT employee_id, first_name, last_name, job_id FROM employees WHERE first_name='Steven';
-- first_name은 문자형이기에 반드시 ''를 사용. steven, STEVEN 하면 결과가 달라짐.
-- 4.WHERE + 날짜
SELECT employee_id, first_name, job_id ,hire_date FROM employees WHERE hire_date > '05/01/01';
-- WHERE절 사용시 날짜는 >,< 부등호도 사용 가능. 위의 예시는 05년1월1일 이후 입사자들 데이터만 추출.
-- 5.비교 연산자
SELECT * FROM employees WHERE salary >= 12000;
-- 정수형은 그냥 입력하면 된다. 부등호도 당연히 사용 가능.
SELECT * FROM employees WHERE first_name > 'King';
-- K보다 큰 문자들, L부터 출력을 해준다. A가 1 Z가 26이라고 생각하면 된다.

--예제1.
SELECT *FROM employees WHERE employee_id = 100;
--예제2.
SELECT * FROM employees WHERE first_name = 'David';
--예제3.
SELECT * FROM employees WHERE employee_id <=105;
--예제4.
SELECT * FROM job_history WHERE start_date > '06/03/03';
--예제5.
SELECT * FROM departments WHERE location_id != 1700;    -- <> 를 써도 된다.

-- 6. AND,OR 논리 연산자
SELECT * FROM employees WHERE department_id = 60 OR (department_id = 80 AND salary > 10000);
SELECT * FROM employees WHERE (department_id = 60 OR department_id = 80) AND salary > 10000;
-- 괄호부터 먼저 연산.
-- 7. Null 연산자
SELECT * FROM employees WHERE hire_date > '08/04/04' OR salary > 13000 AND job_id = 'AD_VP';
-- 괄호가 없을떄는 AND가 먼저 연산되고나서 OR이 됨. 
SELECT * FROM employees WHERE NOT (hire_date > '04/01/01' OR salary > 5000);
-- hire_date <= 04/01/01 and salary <= 5000 조건과 동일함.

--예제1.
SELECT * FROM employees WHERE salary > 4000 and job_id = 'IT_PROG';
--예제2.
SELECT * FROM employees WHERE salary > 4000 and (job_id = 'IT_PROG' or job_id = 'FI_ACCOUNT');

-- 8.IN 연산자
SELECT * FROM employees WHERE salary = 4000 OR salary = 3000 OR salary = 2700;
SELECT * FROM employees WHERE salary IN (4000,3000, 2700);  -- IN을 써서 문장을 줄여줌.

--예제1.
SELECT * FROM employees WHERE salary IN (10000,17000,24000);
--예제2.
SELECT * FROM employees WHERE department_id NOT IN (30,50,80,100,110);  -- 아닌 조건들을 묶어서

-- 9 BETWEEN 연산자
SELECT * FROM employees WHERE salary >= 9000 AND salary <= 10000;
SELECT * FROM employees WHERE salary BETWEEN 9000 AND 10000; -- 위의 조건처럼 9000에서 10000사이면 BETWEEN 사용가능.

--예제1.
SELECT * FROM employees WHERE salary BETWEEN 10000 AND 20000;
--예제2.
SELECT * FROM employees WHERE hire_date BETWEEN '04/01/01' AND '04/12/31';
--예제3.
SELECT * FROM employees WHERE salary NOT BETWEEN 7000 AND 17000; -- 7000미만 17000초과를 범위의 부정으로 표현.

-- 10. LIKE 연산자
SELECT * FROM employees WHERE last_name LIKE 'B%';  -- B%는 last_name에서 B로 시작하는 자료들 모두 추출.
SELECT * FROM employees WHERE last_name LIKE '%b%'; -- %b%는 last_name에서 중간에 b가 있는 자료들을 모두 추출.
SELECT * FROM employees WHERE last_name LIKE '%t';  -- %t는 last_name에서 마지막에 t가 있는 자료들을 모두 추출.
SELECT * FROM employees WHERE last_name LIKE '___s%'; -- ___s 는 last_name에서 네번째에 s가 있는 자료들을 모두 추출.
-- 예제.
SELECT * FROM employees WHERE job_id LIKE '%AD%';
SELECT * FROM employees WHERE job_id LIKE '%AD___'; -- AND가 아니고 한번에 작성. AD뒤에 세자리
SELECT * FROM employees WHERE phone_number LIKE '%1234';
SELECT * FROM employees WHERE phone_number NOT LIKE '%3%' AND phone_number LIKE '%9' ;
SELECT * FROM employees WHERE job_id LIKE '%MGR%' OR job_id LIKE '%ASST%' ;

-- 11. IS NULL , IS NOT NULL 연산자
SELECT * FROM employees WHERE commission_pct IS NULL;   -- commission_pct가 NULL인 것만 출력
SELECT * FROM employees WHERE commission_pct IS NOT NULL;   -- commission_pct가 NULL이 아닌 것만 출력
-- 예제.
SELECT * FROM employees WHERE manager_id IS NULL;       -- manager_id가 NULL인 자료 출력.

-- 12. ORDER BY 연산자
SELECT * FROM employees ORDER BY salary DESC;           -- employees에서 salary열의 내림차순(큰것이 제일먼저)으로 출력.
SELECT * FROM employees ORDER BY salary;                -- employees에서 salary열의 오름차순(작은것이 먼저)으로 출력.
SELECT * FROM employees ORDER BY last_name;             -- last_name이 A부터 출력. 오름차순
SELECT * FROM employees ORDER BY last_name DESC;       -- last_name이 Z부터 출력. 내림차순

--멀티정렬
SELECT employee_id, last_name, department_id FROM employees ORDER BY department_id, employee_id;    -- department_id로 정렬후에 employee_id으로 정렬. 오름차순.
SELECT employee_id, last_name, department_id FROM employees ORDER BY department_id DESC, employee_id; --department_id는 내림차순, employee_id는 오름차순.
-- 열을 생성하여 정렬
SELECT employee_id, last_name, salary*12 AS "연봉" FROM employees ORDER BY 연봉 DESC;   -- 연봉 열을 만들고, 내림차순 정렬.
-- ORDER BY는 WHERE절 다음에 위치
SELECT employee_id, last_name, salary*12 AS "연봉" FROM employees WHERE department_id = 90 ORDER BY 연봉 DESC;

--예제.
SELECT employee_id, last_name, first_name FROM employees ORDER BY employee_id DESC;
SELECT * FROM employees WHERE job_id LIKE '%CLERK%' ORDER BY salary DESC;
SELECT employee_id AS "직원번호", first_name AS "직원이름" , department_id AS "부서번호" , salary AS "월급" FROM employees 
WHERE employee_id BETWEEN 120 AND 150 ORDER BY department_id DESC, salary DESC;





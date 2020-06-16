-- 그룹함수

-- COUNT
SELECT 
COUNT(*) 
FROM employees; -- 행의 개수가 107개 이다. employees테이블은 107개의 행으로 되어있다.

SELECT
COUNT(commission_pct)   -- NULL값은 제외 하고 행의 개수를 센다. 해당 열에는 NULL값이 있다는 의미.
FROM employees;

SELECT
COUNT(NVL(commission_pct,0))        -- NVL로 NULL값을 0으로 만듦. 107개가 카운트 된다.
FROM employees;

SELECT
    COUNT(DISTINCT department_id)            -- NULL값 제외, 중복 제외, 카운트 한다. 총 부서 수.
FROM employees;

SELECT
 COUNT(department_id)                       -- 90번 부서의 직원 수.
FROM employees WHERE department_id=90;

-- 문자열에 적용.
SELECT 
MAX(first_name)  , -- 첫번쨰 문자가 제일 큰것, 동일할때는 두번쨰 문자, 세번쨰문자 순으로 비교.
MIN(first_name) 
FROM employees;

-- 날짜에 적용
SELECT
MAX(hire_date),         -- 가장 최근날짜
MIN(hire_date)          -- 가장 오래된 날짜
FROM employees;

-- SUM, AVG 숫자만 가능.
SELECT
 SUM(salary),
 AVG(salary)
FROM employees;

SELECT
SUM(salary) "Total_Salary",
ROUND (AVG(salary),2)"Average",
MAX(salary) "Best",                         -- 숫자 문자 다 가능.
MIN(salary) "Worst"                         -- 숫자 문자 다 가능.
FROM employees WHERE job_id LIKE '%REP%';

SELECT
 AVG(commission_pct)                -- NULL값은 제외하고 평균계산.
FROM employees;

SELECT
department_id AS "부서명",                              -- GROUP BY 의 기준대로 기입. department_id 이다.
ROUND(AVG(salary)) AS "평균급여",           -- AVG를 이용해서 샐러리 평균을 내고, ROUND로 반올림.
TO_CHAR(ROUND(AVG(salary)),'$999,999,999') AS "$환산"     -- 변환함수를 이용해서 $를 붙여주고 자리수를 나눠주는 출력.
FROM employees GROUP BY department_id;

SELECT
department_id AS "부서명",
ROUND(AVG(salary))AS "평균급여",
SUM(salary)AS "급여합계",
COUNT(*)AS "부서인원"
FROM employees GROUP BY department_id;

SELECT
department_id AS "부서번호",                          -- department_id 별로 나누고
job_id AS "직무명",                                  -- job_id 별로 다시 나눈다. 나누어진 department_id 내에서의
ROUND(AVG(salary))AS "평균급여",
SUM(salary)AS "급여합계",
COUNT(*)AS "부서별 직무 인원"
FROM employees GROUP BY department_id , job_id;     -- department_id , job_id 부서별로나눈뒤, 부서의 직무별로 또 그룹화.

--예제.
SELECT
department_id AS "부서번호",
COUNT(*) AS "부서 인원",
MAX(salary) AS "최고급여",
MIN(salary) AS "최소급여",
SUM(salary) AS "급여합계",
ROUND(AVG(salary)) AS "평균급여"
FROM employees GROUP BY department_id ORDER BY "급여합계" DESC;

SELECT
department_id AS "부서번호",
job_id  AS "직무명",
manager_id AS"관리자번호",
SUM(salary)AS "관리자 급여합계",
COUNT(*) AS "각 관리자 수"
FROM employees GROUP BY department_id, job_id, manager_id ORDER BY department_id;

SELECT
 ROUND(AVG(MAX(salary))) AS "부서별 최고임금 평균",
 ROUND(AVG(MIN(salary))) AS "부서별 최저임금 평균"
FROM employees GROUP BY department_id;

-- HAVING 사용. GROUP BY 를 쓸때는 WHERE을 쓸수가 없다. 그래서 HAVING을 써서 조건비교를 한다.
SELECT
 department_id AS "5인이상 부서번호",
 COUNT(*) AS "5인이상 인원수"
FROM employees GROUP BY department_id HAVING COUNT(*)>=5 ;  -- 부서번호별로 그룹핑하고, 부서의 인원이 5명이상인 조건을 추가.

--예제
SELECT
job_id AS "직무명",
SUM(salary) AS "월급여합계"
FROM employees GROUP BY job_id HAVING AVG(salary)>10000 AND NOT job_id='AC_MGR' ORDER BY "월급여합계" DESC;
-- GROUP BY 전에 WHERE job_id != 'AC_MGR' 조건을 붙여준뒤에 그룹핑을 해도 된다.

SELECT
    department_id,
    ROUND(AVG(salary))
FROM employees GROUP BY department_id HAVING AVG(salary)<=7000 AND NOT department_id=40;
--  GROUP BY 전에 WHERE  department_id != 40 를 작성한후에 그룹핑을 해도 된다.

SELECT
    job_id AS "직무명",
    SUM(salary) AS "급여총액"
FROM employees GROUP BY job_id HAVING SUM(salary)>=13000 AND job_id NOT LIKE '%REP%' ORDER BY "급여총액" DESC;
-- GROUP BY 전에 WHERE job_id NOT LIKE '%REP%' 를 작성한 후에 그루핑을 해도 된다.




-- NULL 관련 함수
-- NVL, NULL 값을 다른 값으로 바꿈.
SELECT last_name, manager_id ,NVL(manager_id,0)AS "매니저"     -- manager_id가 NULL인것을 0으로 바꿈.
FROM employees WHERE last_name = 'King';

-- NVL2(EX,EX1,EX2) , EX값이 NULL아니면 EX1을 , NULL이면 EX2를 출력.
SELECT last_name, commission_pct, 
NVL2(commission_pct,commission_pct,0)   -- commission_pct가 NULL이면 0을 반환, NULL이 아니면commission_pct를 그대로.
FROM employees;

-- NULLIF(EX1,EX2) ,  EX1과 EX2 값이 같으면 NULL을 아니면 EX1을 반환.
SELECT NULLIF(1,1), NULLIF(1,2) FROM DUAL;

-- COALESCE(EX1,EX2,EX3,....) , EX1이 NULL이면 EX2를 반환, EX2가 NULL이면, EX3 반환.
SELECT last_name as "이름" , salary, commission_pct,
COALESCE((salary+(commission_pct*salary)),salary +2000)as "월급인상"
FROM employees order by 3;

--예제.
SELECT
last_name AS "이름", salary AS "월급", 
NVL(commission_pct,0) AS "커미션",                             -- NVL을 이용해서 NULL일때 0으로 만듬.
(salary*12+(salary*12*NVL(commission_pct,0))) AS "연봉"        -- 0을 이용해서 연산 가능.
FROM employees ORDER BY "연봉" desc;

SELECT
last_name AS "이름", salary AS "월급", 
NVL(commission_pct,0) AS "커미션",
(salary*12+(salary*12*NVL(commission_pct,0))) AS "연봉",
NVL2(commission_pct,'SAL+COMM', 'SAL')AS "연봉계산"            -- NVL2를 이용해서 , commission_pct가 NULL이면 SAL출력.
FROM employees ORDER BY "연봉" desc;

SELECT
    first_name AS"이름",LENGTH(first_name)AS"글자수",
    last_name AS"성", LENGTH(last_name)AS "글자수2",
    NULLIF(LENGTH(first_name),LENGTH(last_name))AS "결과"
FROM employees;

-- DECODE 함수 , JAVA의 SWITCH CASE문과 같이 조건이 같은 것이 추출되도록.
SELECT
    last_name AS "이름", job_id, salary AS "급여",
    DECODE(job_id, 'IT_PROG', salary*1.10,      -- job_id가 일치하면 salary연산을 실행.
                   'ST_CLERK', salary*1.15,
                   'SA_REP' , salary*1.20,
                              salary
    ) AS "수정월급"
FROM employees;

--예제.
SELECT
 last_name AS"이름" , job_id, salary AS "급여",
 DECODE(TRUNC(salary/2000), 0 ,   0,
                             1 , 0.09,
                             2 , 0.20,
                             3 , 0.30,
                             4 , 0.40,
                             5 , 0.42,
                             6 , 0.44,
                              0.45
 )AS "세율"
FROM employees;

-- CASE 함수 , DECODE 함수는 비교연산을 못하지만, CASE는 가능하다.
SELECT
 last_name, job_id, salary,
 CASE job_id  WHEN 'IT_PROG' THEN salary*1.10
              WHEN 'ST_CLERK' THEN salary*1.15
             ELSE salary END "월급수정"
FROM employees;

SELECT
 last_name, job_id, salary,
 CASE WHEN salary < 5000 THEN 'LOW'
       WHEN salary < 10000 THEN 'MEDIUM'
       WHEN salary < 20000 THEN 'GOOD'    
    ELSE               'EXCELLENT'     
    END "급여수준"
FROM employees;

--예제.
SELECT employee_id, first_name, last_name, salary,
CASE        WHEN salary >= 9000 THEN '상위급여'
             WHEN salary >= 6000 THEN '중위급여'
            ELSE                       '하위급여'                            
END "급여등급"
FROM employees WHERE job_id = 'IT_PROG';
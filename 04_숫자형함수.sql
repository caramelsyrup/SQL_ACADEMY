-- 숫자형 함수
-- 1. ROUND
SELECT 
ROUND(15.193,1),         -- 소수점 첫째자리까지만 출력. 반올림.
ROUND(15.193,2),         -- 소수점 둘째자리까지만 출력. 반올림.
ROUND(15.193,0),         -- 소수점 이하 없음. 반올림.
ROUND(15.193),          -- 디폴트
ROUND(15.193,-1),         -- -1은 10의자리까지 출력, 반올림.
ROUND(215.193,-2)        -- -2 는 100의 자리까지 출력, 반올림.
FROM DUAL;

-- 2. TRUNC
SELECT
    TRUNC(15.79,1),     -- 소수점 첫째자리까지만 출력
    TRUNC(15.79,0),     -- 소수점 이하 없음
    TRUNC(15.79),       -- 디폴트
    TRUNC(15.79,-1)     -- -1은 10의자리까지 출력
FROM DUAL;

-- 3. MOD
SELECT
    employee_id AS "짝수번호" , last_name
FROM employees WHERE MOD(employee_id,2)=0 ORDER BY 1; -- 1로 정렬은 1번째 열로 정렬(오름차순)

--예제.
SELECT
    salary,
    ROUND(salary/30) AS "정수",
    ROUND(salary/30,1) AS "소수 첫째",
    ROUND(salary/30,-1) AS "10의자리"
FROM employees;
-- 집합 연산자

-- UNION ( 합집합 중복제거 : 115행 )
select employee_id, job_id 
from employees
UNION 
select employee_id, job_id 
from job_history;

-- UNIONALL (중복포함 : 117행) 
select employee_id, job_id 
from employees
UNION ALL 
select employee_id, job_id 
from job_history;

-- INTERSECT (교집합)
select employee_id, job_id 
from employees
INTERSECT
select employee_id, job_id 
from job_history;


-- MINUS  (차집합)
select employee_id, job_id 
from employees
MINUS
select employee_id, job_id 
from job_history;


-- 예제1)
select department_id from employees 
UNION
select department_id from departments  ;


-- 예제2)
select department_id from employees 
UNION ALL
select department_id from departments ;

-- 예제3)
select department_id from departments
INTERSECT
select department_id from employees ;

-- 예제4)
select department_id from departments
MINUS
select department_id from employees ;
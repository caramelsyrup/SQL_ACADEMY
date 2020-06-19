-- <서브쿼리> 

-- Abel직원보다 급여를 더 많이 받는 지원들?

--Abel의 급여 확인
select salary from employees where last_name = 'Abel';

-- 서브쿼리를 사용 
-- 단일행 연산자 ( =, >,<,<=,=>,<>,!=)

select employee_id,last_name, salary 
from employees where salary > (select salary 
                                                  from employees 
                                                  where last_name = 'Abel');
                                               

-- 에러가 나는 경우
select employee_id,last_name, salary 
from employees where salary > (select salary 
                                                  from employees 
                                                  where department_id = 30);
                                                              

-- 그룹함수를 서브쿼리로 이용
-- 그룹함수 예로 MAX는 가장 높은 급여를 받는 사람을 알수 없음.
select * from employees where salary = 
(select max(salary) from employees);
                                                     
                                                     
-- 예제1
select last_name, salary 
from employees where salary > (select salary 
                                                  from employees 
                                                  where last_name = 'Abel');

-- ★ 예제2         ( 이중 서브쿼리)   
-- 문제 : 'Bull'이란 last_name을 가진 사원의 부서에서 Bull보다 높은 급여를 받는 사원 출력(sub query)사용 
-- > salary랑 department_id 순서 바꿔도 상관없다.

select employee_id, first_name, department_id, salary 
from employees where salary >
(select salary from employees where last_name = 'Bull' )
and department_id = (select department_id from employees where last_name = 'Bull' );


-- 예제3
select last_name, salary, manager_id from employees where  manager_id =
(select employee_id from employees where last_name = 'Russell');

-- ★ 예제4 : 조인 안해도됨 
-- 문제 : jobs 테이블에 job_title이 'Stock Manager'의 job_id를 가진 직원들의 정보를 Employees 테이블에서 찾아서 출력하시오.
-- 즉 서브쿼리의 from 테이블과, 일반쿼리의 from 테이블이 다를 수 있다. 

select * from employees 
where job_id = 
(select job_id from jobs where job_title = 'Stock Manager');


-- 다중행 서브쿼리
-- 연산자 (in, any, all) 
select  salary from employees where department_id=90;


-- IN연산자 : 하나만 일치하면 참 ( ' = ' )
select employee_id, first_name, last_name, salary
from employees where salary 
IN(select  salary from employees where department_id=90);


-- 비교연산자 + ANY연산자 : 하나의 조건만 만족 
select employee_id, first_name, last_name, salary
from employees where salary >=
ANY(select  salary from employees where department_id=90);


-- 비교연산자 + ALL 연산자 : 모든 조건 만족 
select employee_id, first_name, last_name, salary
from employees where salary >=
ALL(select  salary from employees where department_id=90);


-- ★예제1)
-- Q. 부서번호가 20번인 직원들의 매니저아이디와 같은 매니저를 가지는 직원 출력 
--(단, 20번 부서 직원은 제외 

select employee_id, first_name, job_id, salary,department_id from employees where manager_id 
IN(select manager_id from employees where department_id = 20)
and department_id != 20;


-- 예제2)
select employee_id, last_name, job_id, salary  
from employees 
where salary < ANY(select salary from employees where job_id='ST_MAN') ;

--★ 예제3)
select employee_id, last_name, job_id, salary
from employees 
where salary < all(select salary from employees where job_id='IT_PROG');
-- IT프로그 중 가장 낮은 급여보다도 낮은 급여를 받는 직원 조회 (ALL이니까)
-- sal 이 4200미만인 것만 조회됨


-- 다중열 서브쿼리 
-- 브루스와 직종과 매니저가 같은 직원을 조회하지만, BRUCE 자신은 제외
select * from employees 
where (manager_id, job_id) in (select manager_id, job_id
                                              from employees
                                              where first_name = 'Bruce')
                         and first_name != 'Bruce';    


-- 부서별 최소 급여를 받는 사원의 부서번호, 사원번호, 이름 급여 정보 검색
-- oo 별 -> group by oo 하기

select department_id 부서번호, employee_id 사원번호, 
first_name, salary from employees 
where (department_id, salary) IN (select department_id, min(salary)
                                             from employees group by department_id)
 order by 1;
 
 
 -- 예제)
 select first_name, job_id, salary, department_id 
 from employees 
 where (job_id, salary)  IN (select job_id, min(salary) 
 from employees group by job_id)  
 order by 3 desc;



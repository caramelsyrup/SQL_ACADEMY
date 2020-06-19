-- 조인
select e.employee_id, e.department_id, d.department_name -- e.department_id나 d.department_id 같음!!
from employees e 
join departments d --em + dep 테이블 합침
    on e.department_id = d.department_id; -- em.deid가 de.de_id참조함

-- 네추럴 조인 : on절 생략
select employee_id, first_name, 
job_id, job_title
from employees 
natural join jobs;

-- 기본 동등조인
select e.employee_id, j.job_id, j.job_title
from employees e
join jobs j
    on e.job_id = j.job_id;

-- where절 추가    
select e.employee_id, e.department_id, d.department_name
from employees e 
join departments d --em + dep 테이블 합침
    on e.department_id = d.department_id
where d.department_id = 50; --50번 부서만  join해서 보겠당!!

-- 3개 테이블 조인 (2개의 조인 사용)
select e.employee_id, d.department_name, lo.city,
from employees e 
join departments d on e.department_id = d.department_id
join locations lo     on d.location_id = lo.location_id;

select d.department_name 부서명, lo.city 도시명, c.country_name 국가명
from departments d
join locations lo on d.location_id = lo.location_id
join countries c   on c.country_id = lo.country_id
where (lo.city = 'Seattle' or lo.city ='London') and c.country_name like 'United%'  
-- 다중 where 절 알아두기,, ★ % 쓸때는 like쓰는 거 잊지말기!!
order by 2;


-- 자체조인
select e.last_name 직원, e.employee_id 직원번호, m.last_name 매니저, m.employee_id 직원번호2
from employees e
join employees m
        on e.manager_id = m.employee_id;
        
select employee_id, last_name, manager_id 
from employees where last_name = 'Kumar';

-- 리뷰 예제


select d.department_name 부서명, lo.city 도시명, c.country_name 국가명
from departments d
join locations lo on d.location_id = lo.location_id
join countries c   on c.country_id = lo.country_id
where (lo.city = 'Seattle' or lo.city ='London') and c.country_name like 'United%'  
-- 다중 where 절 알아두기,, ★ % 쓸때는 like쓰는 거 잊지말기!!
order by 2;

--4
select lo.city, round(avg(e.salary)), count(*) from employees e
join departments d on e.department_id = d.department_id
join locations lo on lo.location_id = d.location_id
group by lo.city
having  count(*)<10
order by 2;


--★ 5 : 자신 매니저보다 급여를 많이 받는 직원들의 성, 급여, 매니저의 last_name과 salary 출력 
select e.employee_id, e.last_name,
e.salary, m.last_name , m.salary
from EMPLOYEES e
join EMPLOYEES m on e.manager_id=m.employee_id
where e.salary > m.salary;



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
select e.employee_id, d.department_name, lo.city
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

-- 외부조인( OUTER JOIN) 
-- > 조인 조건에 일치하지 않는 데이터까지 모두 출력 
-- > LEFT, RIGHT 여부는 LEFT가 먼저 기술한 테이블, RIGHT가 나중에 기술한 테이블
-- > <테이블1> : 왼쪽 테이블, <테이블2> 오른쪽테이블 
-- select에서 앞쪽에 입력되는 값에 해당되는 테이블을 from 테이블로,
-- 뒤에 입력되는 값을 __ outer join 테이블로 해서 적긔 

--LEFT OUTER JOIN : 왼쪽행은 일치하지 않아도 다 출력 
select e.last_name 직원, e.department_id 부서번호, d.department_name 부서명 
from employees e 
LEFT OUTER JOIN departments d on e.department_id = d.department_id;


--RIGHT OUTER JOIN : 오른쪽이 NULL무진쟝 출력
select e.last_name 직원, e.department_id 부서번호, d.department_name 부서명 
from employees e 
RIGHT OUTER JOIN departments d on e.department_id = d.department_id;

-- FULL OUTER JOIN : 출력되는 행이 제일 多
select e.last_name 직원, e.department_id 부서번호, d.department_name 부서명 
from employees e 
FULL OUTER JOIN departments d on e.department_id = d.department_id;

-- 예제) 앞의 어떤 테이블을 넣을지 순서가 중요한거같네용,,
select c.country_name, c.country_id, lo.location_id, lo.city 
from   countries c
LEFT OUTER join  locations lo
on c.country_id = lo.country_id
order by 3 desc;



-- 교차조인 (cross join) : 한 쪽 테이블 모든 행 + 다른 테이블 모든 행 연결
-- cross join에는 on이 없다. 

-- 예제)
select c.country_name 국가 , r.region_name 지역이름 from countries c
cross join regions r;


-- 리뷰 예제
-- 1 ( || 사용 알아두긔 )
select  d.department_name 부서명 , d.manager_id 매니저번호,
e.last_name || ' ' || e.first_name "매니저이름(직원이름)", e.phone_number 
from departments d 
join employees e on d.manager_id = e.employee_id;

-- 2
select e.employee_id 사원번호, e.hire_date 고용일자, j.job_id 직종 , j.job_title 직책 
from employees e 
join jobs j 
on e.job_id = j.job_id;

--★3
select to_char(e.hire_date, 'YYYY') 입사년도, round(avg(e.salary)) 평균급여  from employees e
join jobs j
on e.job_id = j.job_id
where  j.job_title='Sales Manager'
group by  to_char(e.hire_date, 'YYYY') order by 1;
-- 그룹을 나누는데, 입사년도를 기준으로 
-- "입사년도그룹별"로 라고 했으니까 ,, 


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



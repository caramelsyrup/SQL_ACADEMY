-- 조인
-- 기본키와 외래키가 있어야한다.
SELECT *FROM employees JOIN departments                 -- departments테이블과 employees를 합친다.
ON employees.department_id = departments.department_id; 
-- ON절에 mployees.department_id과 epartments.department_id 같다고

SELECT
    e.department_id, d.department_id, d.department_name    -- department_id는 둘다 동일. 
FROM employees e JOIN departments d                       -- employees 와 departments를 합친다.
ON e.department_id = d.department_id;                   -- employees의 외래키, departments의 기본키가 같음.

-- 데이터베이스 설계 때부터 중복되는 열은 나누어서 데이터 테이블을 만듦.

-- NATURAL JOIN
SELECT
    employee_id, first_name,                -- employees테이블에는 first_name존재
    job_id, job_title                       -- jobs테이블에는 job_title존재
FROM employees NATURAL JOIN jobs;         -- 공통으로는 employee_id, first_name

--기본 동등조인
SELECT
    e.employee_id , j.job_id, j.job_title, e.job_id         -- employee_id 는 employees테이블, job_title은 jobs테이블.
FROM employees e JOIN jobs j ON e.job_id = j.job_id;

-- where 절 추가
SELECT
    e.department_id, d.department_id, d.department_name    
FROM employees e JOIN departments d                      
ON e.department_id = d.department_id WHERE d.department_id>50; -- where절 추가 가능

-- 3개의 테이블 join
SELECT
    e.department_id, d.department_id, d.location_id, l.location_id, -- 연결된 테이블들의 공통 키값.
    e.first_name, d.department_name, l.country_id   
    -- first_name은 employees테이블, department_name은 departments테이블, country_id는 locations테이블에만 있는 값.
FROM employees e JOIN departments d on e.department_id = d.department_id    -- employees와 departments 테이블의 공통 값을 연결
JOIN locations l on d.location_id = l.location_id;      -- departments와 locations 테이블의 공통 값 연결.

-- 예제.
SELECT
    d.department_name AS "부서명", l.city AS "도시명", c.country_name AS "국가명"
FROM departments d 
JOIN locations l on d.location_id = l.location_id 
JOIN countries c on c.country_id=l.country_id
WHERE l.city IN('Seattle','London');  
-- OR을 써서 Seattle,London 조건을 만들고, AND로 country_name LIKE 'United%'를 해도 됨. 테이블에 값이 United가 있음.

-- 자체조인 SELF JOIN
-- 예를 들면, 직원 테이블에서도 ID값이 존재하지만, 관리자에서도 ID값이 존재함. 모두 회사의 직원이기 때문에.
-- 사실 직원 테이블에서 관리자 정보를 다 알수 있음.
-- 관리자나 직원이나 둘다 ID값을 알 수 있고, 저장되어 있음.

SELECT
e.last_name AS "직원", m.last_name AS "관리자"
FROM employees e JOIN employees m ON e.manager_id = m.employee_id 
-- employees안에 manager_id와 employee_id가 다있음. 현재 manager_id는 곧 employee_id이다.
-- manager_id가 있는 employee_id는 상관이 존재하는 것. 
-- 그래서 해당 manager_id를 employee_id에서 찾으면 그 사람이 상사인 것.
WHERE e.last_name='Smith';

-- 외부조인( OUTER JOIN) 
-- > 조인 조건에 일치하지 않는 데이터까지 모두 출력.
-- > LEFT, RIGHT 여부는 LEFT가 먼저 기술한 테이블, RIGHT가 나중에 기술한 테이블
-- > <테이블1> : 왼쪽 테이블, <테이블2> 오른쪽테이블 
-- select에서 앞쪽에 입력되는 값에 해당되는 테이블을 from 테이블로,
-- 뒤에 입력되는 값을 __ outer join 테이블 로 한다.

--LEFT OUTER JOIN : 왼쪽행은 일치하지 않아도 다 출력 
select e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
from employees e                                                           -- 왼쪽 테이블.
LEFT OUTER JOIN departments d on e.department_id = d.department_id;       
-- Grant가 출력된다.department_id , department_name 값이 없는데 조회,출력이 됨.

--RIGHT OUTER JOIN : 오른쪽이 NULL 출력
select e.last_name 직원, e.department_id 부서번호, d.department_name 부서명 
from employees e                                                           
RIGHT OUTER JOIN departments d on e.department_id = d.department_id;      -- 오른쪽 테이블.
-- departments테이블에는 department_id가 존재하지만, employees테이블에는 없는 것들이다. 
-- RIGHT OUTER JOIN이기에, departments가 오른쪽 테이블이고, 이 테이블의 값들을 출력한다.
-- 결과 값은 당연히 last_name은 NULL이다. 해당 department_id를 가진 직원이 없기 때문이다.

-- FULL OUTER JOIN : 양쪽의 테이블들 모두 참조한다.
select e.last_name 직원, e.department_id 부서번호, d.department_name 부서명 
from employees e                                                        -- 왼쪽 테이블.
FULL OUTER JOIN departments d on e.department_id = d.department_id;   -- 오른쪽 테이블.
-- JOIN조건 외의 열값들도 테이블이 서로 관계가 된다면, 모두 조회가 된다.

-- 예제.
SELECT c.country_name AS "국가", c.country_id AS "국가번호",   
        l.location_id AS "지역번호", l.city AS "도시"
FROM countries C LEFT OUTER JOIN locations L ON c.country_id = l.country_id ORDER BY 3 DESC ;

-- 교차조인 (cross join) : 한 쪽 테이블 모든 행 * 다른 테이블 모든 행 연결
-- A테이블의 행이 2개, B테이블의 행이 3개 라면, A-B테이블의 관계에서 2*3=6으로 CROSS JOIN 되면 6개의 행을 가지는 테이블 탄생.
-- cross join에는 on이 없다. 조건이 필요가 없다. 각테이블의 모든 행을 다 참조하기 때문이다.
-- 예제.
SELECT * FROM countries C CROSS JOIN locations L; -- 행의 개수가 575개이다. countries가 25개, locations 23개이기에.
SELECT c.country_name AS "국가이름", r.region_name AS "지역이름" FROM countries C CROSS JOIN regions R; 

-- 리뷰예제.
SELECT d.department_name AS "부서명", d.manager_id AS "관리자번호",
    e.last_name||' '||e.first_name AS " FULL NAME",e.phone_number AS "전화번호"
FROM departments D JOIN employees E ON d.department_id = e.department_id;

SELECT e.employee_id AS "직원번호" , e.hire_date AS "고용일자",
        j.job_id AS "직종", j.job_title AS "직책"
FROM employees E JOIN jobs J ON e.job_id = j.job_id;

SELECT TO_CHAR(e.hire_date,'yyyy') AS "입사년도",avg(e.salary) AS "평균급여"
FROM employees E JOIN jobs J ON e.job_id = j.job_id 
WHERE j.job_title = 'Sales Manager' 
GROUP BY TO_CHAR(e.hire_date,'yyyy')
ORDER BY 1;

SELECT l.city, ROUND(AVG(E.SALARAY), COUNT(*) 
FROM departments D JOIN locations L ON d.location_id = l.location_id
JOIN employees E ON d.department_id = e.employee_id
GROUP BY l.city ORDER BY 2;
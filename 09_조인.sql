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



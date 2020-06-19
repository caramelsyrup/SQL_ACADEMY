--  DML 조작어 > INSERT 명령어.
-- INSERT : 새 행을 입력하기.
-- 1. 실행전 열과 제약조건을 확인 (DESC + 테이블)
DESC departments;   -- NOT NULL 부분 확인. 값이 없으면 안된다는 제약 조건. 무조건 입력이 되어야한다.
-- 전체 열을 다 입력하는 방법 1
INSERT INTO departments (department_id, department_name, manager_id, location_id) 
VALUES (71,'개발부 1',100,1700);   
-- departments에 새로이 넣을 열들을 입력. 열의 이름을 먼저 쓰고 VALUES 다음에 형식에 맞춰서 입력.
SELECT *FROM departments;   -- 새로이 입력이 된것을 확인.
COMMIT;     -- COMMIT을 통해서 영구히 저장.
-- 열의 이름이 없는 경우 전체 열을 다 입력해야 함.
INSERT INTO departments VALUES (72,'개발부 2',100,1700);
ROLLBACK;  
SELECT *FROM departments;    -- 72가 저장이 되어 있지 않은것을 확인.
INSERT INTO departments VALUES (72,'개발부 2',100,1700);
COMMIT;             -- 영구히 저장.
-- 열의 순서를 바꿀경우
INSERT INTO departments (department_name, manager_id, location_id,department_id) 
VALUES ('개발부 3',100,1700,73);   -- 새로이 입력하는 값도 순서를 같이 바꿔야함.
COMMIT;
-- 자동으로 널값입력.
INSERT INTO departments (department_name,department_id) 
VALUES ('개발부 4',74);    -- NOT NULL 인 열 값들만 입력을 한다.
COMMIT;
DESC departments; -- 열들의 조건들을 다시 확인.
SELECT * FROM departments ORDER BY department_id;  -- 추가시킨 행을 확인 함.

-- SYSDATE 현재 날짜 입력
DESC employees;
INSERT INTO employees(employee_id,first_name,last_name,email,hire_date,job_id)
VALUES (1,'HONG','GILDONG','HONG@naver.com',SYSDATE,'IT_PROG');
-- 중복이 되는 값을 넣으면 에러가 난다.
COMMIT;
SELECT*FROM employees ORDER BY 1;
-- 날짜를 입력.
INSERT INTO employees(employee_id,first_name,last_name,email,hire_date,job_id)
VALUES (2,'GANG','GILDONG','GANG@naver.com',TO_DATE('2020-04-05', 'YYYY/MM/DD'),'IT_PROG');


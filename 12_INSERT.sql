--  DML 조작어 > INSERT 명령어.
-- INSERT : 새 행을 입력하기.
-- 1. 실행전 열과 제약조건을 확인 (DESC + 테이블)
DESC departments;  -- NOT NULL 부분 확인. 값이 없으면 안된다는 제약 조건. 무조건 입력이 되어야한다.
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
COMMIT;

-- 사용자로부터 입력받기
SELECT*FROM departments;
INSERT INTO departments (department_name,department_id) 
VALUES ('&name',&id);   --&을 이용하면 입력창을 띄워서 직접 입력가능.
commit;

-- 테이블 만들기
create table xx_EMP (   -- xx_EMP라는 테이블을 만듬.
EMPNO number, 
ENAME varchar2(100), 
SAL number);
-- 테이블 전체를 copy, 존재하는 열만 추려서 복사.
INSERT INTO xx_EMP (EMPNO,ENAME,SAL) SELECT employee_id, first_name,salary FROM employees;

--INSERT를 실행 중에 에러가 나는 경우.
-- 1. 기본키에 이미 있는 (중복된) 값을 입력할 경우.
SELECT*FROM departments;
INSERT INTO departments (department_name,department_id,manager_id,location_id)
VALUES ('개발부 10',10,100,1700);  -- 10에 이미 값이 있기때문에, unique constraint 에러가 발생.
--2. FK(외래키)에 참조되지 않은 값을 입력
SELECT*FROM departments;
INSERT INTO departments (department_name,department_id,manager_id,location_id)
VALUES ('개발부 10',5,100,1);  -- 1은 location_id에 없는 키값이다. parent key not found 에러 발생.
-- 3.데이터의 종류가 틀릴때
INSERT INTO departments (department_name,department_id,manager_id,location_id)
VALUES ('개발부 10','12아',100,1);  -- '12아'는 department_id의 데이터형식과 다름. invalid number 에러 발생.
-- 4. 데이터의 사이즈가 맞지 않을때
INSERT INTO departments (department_name,department_id,manager_id,location_id)
VALUES ('개발부 10개발부 10개발부 10개발부 10개발부 10개발부 10',12,100,1);
-- department_name의 사이즈제한을 넘었음. value too large for column 에러 발생.
-- 테이블을 카피하기
CREATE TABLE COPY_DEPT AS SELECT * FROM departments;        -- departments테이블 전체를 복사.

-- 예제.
INSERT INTO departments (department_id,department_name,manager_id,location_id)
VALUES (271,'Sample Dept 1',200,1700);
INSERT INTO departments (department_id,department_name,manager_id,location_id)
VALUES (272,'Sample Dept 2',200,1700);
INSERT INTO departments (department_id,department_name,manager_id,location_id)
VALUES (273,'Sample Dept 3',200,1700);
commit;

CREATE TABLE copy_departments( department_id number(4,0),
                                department_name varchar2(30),
                                manager_id number(6,0),
                                location_id number(4,0));
INSERT INTO copy_departments        -- copy_departments테이블에
SELECT department_id,department_name,manager_id,location_id 
FROM departments;   -- departments테이블에 열값들을 조회해서 넣어라.
-- SELECT * FROM departments; 도 실행가능. 
commit;


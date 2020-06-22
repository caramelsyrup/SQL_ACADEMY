-- 단순한 VIEW 만들기
-- 하나의 원본 테이블 사용, 함수나 그룹 사용 안함, DML 사용가능.

DROP VIEW EMP_V1;   -- VIEW 삭제 명령.

-- EMPLOYEES 테이블에서 필요한 열들을 골라서 뷰(VIEW)로 생성.
CREATE VIEW EMP_V1 AS
SELECT employee_id, last_name, email, hire_date,job_id FROM employees;

SELECT * FROM EMP_V1;

DESC EMP_V1;
-- 테이블처럼 DML이 가능하다. VIEW는 저장공간이 없는데 입력이 됨. 원본테이블에 입력이 됨.
INSERT INTO EMP_V1 VALUES (333,'David','DAVID',SYSDATE,'IT_PROG');
-- VIEW에 입력된 데이터 확인. 필요한 데이터만 입력받도록 하고, 나머지 데이터는 볼수 없도록.
SELECT * FROM employees;
DESC employees;

DELETE FROM EMP_V1 WHERE employee_id = 333;             -- 원본에도 삭제
COMMIT;

CREATE VIEW EMP_V2 AS
SELECT employee_id AS "직원번호", last_name AS "이름", email, hire_date,job_id
  FROM employees;
    -- 설정한 별칭도 생성,조회 완료.
SELECT  *  FROM EMP_V2;

CREATE VIEW EMP_V3(직원번호,이름,이메일,고용일자,직종) AS  -- 열의 이름을 정하면서 뷰생성.
SELECT employee_id, last_name, email, hire_date,job_id
FROM employees;
SELECT  *  FROM EMP_V3;

-- DML사용,
INSERT INTO EMP_V3 (직원번호,이름,이메일,고용일자,직종)
VALUES (334,'LaLa','LALA',sysdate,'IT_PROG');
SELECT  *  FROM employees;  -- 생성확인 됨. 원본 테이블이 수정이 되어버림.
SELECT * FROM EMP_V1;
SELECT  *  FROM EMP_V2; -- 이전에 만들었던 VIEW 테이블들도 수정이 된다. 원본 테이블이 같기 때문.

-- 복잡한 뷰 만들기
-- 그룹함수를 사용한 뷰는 DML 사용 불가능.
CREATE VIEW 부서별_직원_보고서 AS
SELECT department_id AS "부서번호", COUNT(employee_id) AS "직원수",
        MAX(salary) AS "최고급여" , MIN(salary) AS "최저급여"
FROM employees GROUP BY department_id;                           -- 실행이 되지 않는다.

SELECT * FROM 부서별_직원_보고서;

INSERT INTO 부서별_직원_보고서 VALUES (200,4,10000,1000);   
-- 당연히 오류가 난다. 그룹함수 값의 결과를 직접 입력하는 것은 논리상 맞지 않다. 
-- VIEW를 수정하고 싶으면 OR REPLACE를 CREATE에 붙여준다.
CREATE OR REPLACE VIEW 부서별_직원_보고서 AS
SELECT department_id AS "부서번호", COUNT(employee_id) AS "직원수",
        MAX(salary) AS "최고급여" , MIN(salary) AS "최저급여",
        ROUND(AVG(salary)) AS "평균급여"
FROM employees GROUP BY department_id ORDER BY 1;       -- 부서번호로 오름차순 정렬이 된 것을 알수 있다.

-- 읽기 전용 VIEW ( WITH READ ONLY )
CREATE OR REPLACE VIEW EMP_V_READ AS
SELECT employee_id,last_name,email,hire_date,job_id 
FROM employees WHERE department_id = 90
WITH READ ONLY;
SELECT * FROM emp_v_read;

-- DML 사용 불가
DELETE FROM emp_v_read;             -- 오류가 뜬다.

-- 체크 옵션 뷰
CREATE OR REPLACE VIEW emp_v_check AS
SELECT employee_id,last_name,email,hire_date,job_id,department_id 
FROM employees WHERE department_id = 90
WITH CHECK OPTION;                          -- department_id = 90 일때만, 수정및 입력 가능.

INSERT INTO EMP_V_CHECK VALUES (444,'Ali','ALI',SYSDATE,'IT_PROG',90);  -- 90인 경우 INSERT가 실행.

SELECT * FROM EMP_V_CHECK;


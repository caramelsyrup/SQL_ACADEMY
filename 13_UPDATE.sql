-- UPDATE 데이터 수정하기
-- UPDATE 사용시, WHERE절에 항상 기본키를 활용.

CREATE TABLE cop_emp AS SELECT * FROM employees;
UPDATE cop_emp SET salary = 24100 WHERE employee_id=100;
-- employee_id=100인 행에서 salary = 24100로 변경.
COMMIT;   
SELECT *FROM cop_emp;
UPDATE cop_emp SET salary = 24100 WHERE first_name='Steven';
-- 의도치 않게 두 명의 자료 값이 수정이 되어버림.
commit;
-- WHERE 절을 쓰지 않을 경우.
UPDATE cop_emp SET phone_number = '132-156-575';
-- 모든 행이 다 수정이 됨.
ROLLBACK;

INSERT INTO copy_departments (department_id,department_name) VALUES (280,'Music');
UPDATE copy_departments SET manager_id=100, location_id=1800 WHERE department_id=280;
UPDATE copy_departments SET manager_id=100 WHERE department_id BETWEEN 150 AND 200;
UPDATE copy_departments SET manager_id=100,location_id=1800 WHERE department_id IN (74,75);
SELECT * FROM copy_departments;

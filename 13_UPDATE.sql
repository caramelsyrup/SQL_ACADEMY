-- UPDATE ������ �����ϱ�
-- UPDATE ����, WHERE���� �׻� �⺻Ű�� Ȱ��.

CREATE TABLE cop_emp AS SELECT * FROM employees;
UPDATE cop_emp SET salary = 24100 WHERE employee_id=100;
-- employee_id=100�� �࿡�� salary = 24100�� ����.
COMMIT;   
SELECT *FROM cop_emp;
UPDATE cop_emp SET salary = 24100 WHERE first_name='Steven';
-- �ǵ�ġ �ʰ� �� ���� �ڷ� ���� ������ �Ǿ����.
commit;
-- WHERE ���� ���� ���� ���.
UPDATE cop_emp SET phone_number = '132-156-575';
-- ��� ���� �� ������ ��.
ROLLBACK;

INSERT INTO copy_departments (department_id,department_name) VALUES (280,'Music');
UPDATE copy_departments SET manager_id=100, location_id=1800 WHERE department_id=280;
UPDATE copy_departments SET manager_id=100 WHERE department_id BETWEEN 150 AND 200;
UPDATE copy_departments SET manager_id=100,location_id=1800 WHERE department_id IN (74,75);
SELECT * FROM copy_departments;
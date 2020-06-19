--  DML ���۾� > INSERT ���ɾ�.
-- INSERT : �� ���� �Է��ϱ�.
-- 1. ������ ���� ���������� Ȯ�� (DESC + ���̺�)
DESC departments;  -- NOT NULL �κ� Ȯ��. ���� ������ �ȵȴٴ� ���� ����. ������ �Է��� �Ǿ���Ѵ�.
-- ��ü ���� �� �Է��ϴ� ��� 1
INSERT INTO departments (department_id, department_name, manager_id, location_id) 
VALUES (71,'���ߺ� 1',100,1700);   
-- departments�� ������ ���� ������ �Է�. ���� �̸��� ���� ���� VALUES ������ ���Ŀ� ���缭 �Է�.
SELECT *FROM departments;   -- ������ �Է��� �Ȱ��� Ȯ��.
COMMIT;     -- COMMIT�� ���ؼ� ������ ����.
-- ���� �̸��� ���� ��� ��ü ���� �� �Է��ؾ� ��.
INSERT INTO departments VALUES (72,'���ߺ� 2',100,1700);
ROLLBACK;  
SELECT *FROM departments;    -- 72�� ������ �Ǿ� ���� �������� Ȯ��.
INSERT INTO departments VALUES (72,'���ߺ� 2',100,1700);
COMMIT;             -- ������ ����.
-- ���� ������ �ٲܰ��
INSERT INTO departments (department_name, manager_id, location_id,department_id) 
VALUES ('���ߺ� 3',100,1700,73);   -- ������ �Է��ϴ� ���� ������ ���� �ٲ����.
COMMIT;
-- �ڵ����� �ΰ��Է�.
INSERT INTO departments (department_name,department_id) 
VALUES ('���ߺ� 4',74);    -- NOT NULL �� �� ���鸸 �Է��� �Ѵ�.
COMMIT;
DESC departments; -- ������ ���ǵ��� �ٽ� Ȯ��.
SELECT * FROM departments ORDER BY department_id;  -- �߰���Ų ���� Ȯ�� ��.

-- SYSDATE ���� ��¥ �Է�
DESC employees;
INSERT INTO employees(employee_id,first_name,last_name,email,hire_date,job_id)
VALUES (1,'HONG','GILDONG','HONG@naver.com',SYSDATE,'IT_PROG');
-- �ߺ��� �Ǵ� ���� ������ ������ ����.
COMMIT;
SELECT*FROM employees ORDER BY 1;
-- ��¥�� �Է�.
INSERT INTO employees(employee_id,first_name,last_name,email,hire_date,job_id)
VALUES (2,'GANG','GILDONG','GANG@naver.com',TO_DATE('2020-04-05', 'YYYY/MM/DD'),'IT_PROG');
COMMIT;

-- ����ڷκ��� �Է¹ޱ�
SELECT*FROM departments;
INSERT INTO departments (department_name,department_id) 
VALUES ('&name',&id);   --&�� �̿��ϸ� �Է�â�� ����� ���� �Է°���.
commit;

-- ���̺� �����
create table xx_EMP (   -- xx_EMP��� ���̺��� ����.
EMPNO number, 
ENAME varchar2(100), 
SAL number);
-- ���̺� ��ü�� copy, �����ϴ� ���� �߷��� ����.
INSERT INTO xx_EMP (EMPNO,ENAME,SAL) SELECT employee_id, first_name,salary FROM employees;

--INSERT�� ���� �߿� ������ ���� ���.
-- 1. �⺻Ű�� �̹� �ִ� (�ߺ���) ���� �Է��� ���.
SELECT*FROM departments;
INSERT INTO departments (department_name,department_id,manager_id,location_id)
VALUES ('���ߺ� 10',10,100,1700);  -- 10�� �̹� ���� �ֱ⶧����, unique constraint ������ �߻�.
--2. FK(�ܷ�Ű)�� �������� ���� ���� �Է�
SELECT*FROM departments;
INSERT INTO departments (department_name,department_id,manager_id,location_id)
VALUES ('���ߺ� 10',5,100,1);  -- 1�� location_id�� ���� Ű���̴�. parent key not found ���� �߻�.
-- 3.�������� ������ Ʋ����
INSERT INTO departments (department_name,department_id,manager_id,location_id)
VALUES ('���ߺ� 10','12��',100,1);  -- '12��'�� department_id�� ���������İ� �ٸ�. invalid number ���� �߻�.
-- 4. �������� ����� ���� ������
INSERT INTO departments (department_name,department_id,manager_id,location_id)
VALUES ('���ߺ� 10���ߺ� 10���ߺ� 10���ߺ� 10���ߺ� 10���ߺ� 10',12,100,1);
-- department_name�� ������������ �Ѿ���. value too large for column ���� �߻�.
-- ���̺��� ī���ϱ�
CREATE TABLE COPY_DEPT AS SELECT * FROM departments;        -- departments���̺� ��ü�� ����.

-- ����.
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
INSERT INTO copy_departments        -- copy_departments���̺���
SELECT department_id,department_name,manager_id,location_id 
FROM departments;   -- departments���̺��� �������� ��ȸ�ؼ� �־��.
-- SELECT * FROM departments; �� ���డ��. 
commit;

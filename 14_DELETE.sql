-- �������� ����
SELECT * FROM departments;
-- 71~75���� ����.
DELETE FROM departments WHERE department_id BETWEEN 71 AND 75;
COMMIT;
-- 271~273 ����.
DELETE FROM departments WHERE department_id BETWEEN 271 AND 273;
COMMIT;

SELECT * FROM employees;
DELETE FROM employees WHERE employee_id IN (1,2);
COMMIT;

--���̺� ��ü ����
DELETE FROM copy_departments; -- ���̺��� �������� �ʰ�, ���� �����͸� ������ �ȴ�.
ROLLBACK;                      -- ����.
-- TRUNCATE TABLE: ��ü ������ ����. ROLLBACK �Ұ���.
TRUNCATE TABLE copy_departments;
rollback;   -- rollback�ص� ������ ������ �ȵ�.
-- DROP ���̺� - ���̺��� ����
DROP TABLE copy_departments;
drop table copy_dept;
drop table xx_emp;

-- ���̺�����Ʈ
SELECT * FROM cop_emp WHERE employee_id=108;                        -- salary = 12008
UPDATE cop_emp SET salary = salary+10 WHERE employee_id=108;        -- salary = 12018
SAVEPOINT A;
UPDATE cop_emp SET salary = salary+20 WHERE employee_id=108;        -- salary = 12038
ROLLBACK TO SAVEPOINT A;                                           -- salary = 12018
ROLLBACK;                                                           -- salary = 12008
COMMIT;
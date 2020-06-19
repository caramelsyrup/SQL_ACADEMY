-- 데이터의 삭제
SELECT * FROM departments;
-- 71~75까지 삭제.
DELETE FROM departments WHERE department_id BETWEEN 71 AND 75;
COMMIT;
-- 271~273 삭제.
DELETE FROM departments WHERE department_id BETWEEN 271 AND 273;
COMMIT;

SELECT * FROM employees;
DELETE FROM employees WHERE employee_id IN (1,2);
COMMIT;

--테이블 전체 삭제
DELETE FROM copy_departments; -- 테이블이 삭제되지 않고, 안의 데이터만 삭제가 된다.
ROLLBACK;                      -- 가능.
-- TRUNCATE TABLE: 전체 데이터 삭제. ROLLBACK 불가능.
TRUNCATE TABLE copy_departments;
rollback;   -- rollback해도 데이터 복구가 안됨.
-- DROP 테이블 - 테이블을 삭제
DROP TABLE copy_departments;
drop table copy_dept;
drop table xx_emp;

-- 세이브포인트
SELECT * FROM cop_emp WHERE employee_id=108;                        -- salary = 12008
UPDATE cop_emp SET salary = salary+10 WHERE employee_id=108;        -- salary = 12018
SAVEPOINT A;
UPDATE cop_emp SET salary = salary+20 WHERE employee_id=108;        -- salary = 12038
ROLLBACK TO SAVEPOINT A;                                           -- salary = 12018
ROLLBACK;                                                           -- salary = 12008
COMMIT;

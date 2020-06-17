-- 연습문제
-- 1.
SELECT empno AS "사원번호", ename AS"이름", sal AS"월급" FROM emp WHERE deptno = 10;
-- 2.
SELECT ename, hiredate, deptno FROM emp WHERE empno LIKE 7369;
-- 3.
SELECT * FROM emp WHERE ename LIKE 'ALLEN';
-- 4.
SELECT ename, deptno, sal FROM emp WHERE hiredate LIKE '81/02/20';
-- 5.
SELECT * FROM emp WHERE job NOT LIKE 'MANAGER';
-- 6.
SELECT * FROM emp WHERE hiredate >= '81/04/02';
-- 7.
SELECT ename,sal,deptno FROM emp WHERE sal >= 800;
-- 8.
SELECT * FROM emp WHERE deptno >= 20;
-- 9.
SELECT * FROM emp WHERE ename > 'L';
-- 10.
SELECT * FROM emp WHERE hiredate < '1981/12/09';
-- 11.
SELECT empno, ename FROM emp WHERE empno <= 7698;
-- 12.
SELECT ename, sal, deptno FROM emp WHERE hiredate >= '81/04/02' OR hiredate >='82/12/09';
-- 13.
SELECT ename,job,sal FROM emp WHERE sal>1600 AND sal<3000;
-- 14.
SELECT * FROM emp WHERE empno NOT BETWEEN 7654 AND 7782;
-- 15.
SELECT * FROM emp WHERE ename BETWEEN 'B' AND 'J';
-- 16.
SELECT * FROM emp WHERE hiredate NOT BETWEEN '81/01/01' AND '81/12/31';
-- 17.
SELECT * FROM emp WHERE job = 'MANAGER' OR job='SALESMAN';
-- 18.
SELECT ename,empno,deptno FROM emp WHERE deptno NOT IN (20,30);
-- 19.
SELECT empno, ename, hiredate, deptno FROM emp WHERE ename LIKE 'S%';
-- 20.
SELECT * FROM emp WHERE hiredate LIKE '81%';
-- 21.
SELECT * FROM emp WHERE ename LIKE '%S%';
-- 22.
SELECT * FROM emp WHERE ename LIKE 'M%' AND ename LIKE '%N';
-- 23.
SELECT * FROM emp WHERE ename like '_A%';
-- 24.
SELECT * FROM emp WHERE comm IS NULL;
-- 25.
SELECT * FROM emp WHERE comm IS NOT NULL;
-- 26.
SELECT ename,deptno,sal FROM emp WHERE deptno = 30 AND sal>=1500;
-- 27.
SELECT empno,ename,deptno FROM emp WHERE ename LIKE 'K%' OR deptno IN (30); -- 하거나
-- 28.
SELECT * FROM emp WHERE sal>=1500 AND deptno=30 AND job = 'MANAGER';
-- 29.
SELECT * FROM emp WHERE deptno = 30 ORDER BY empno;
-- 30.
SELECT * FROM emp ORDER BY sal DESC;
-- 31.
SELECT * FROM emp ORDER BY deptno , sal DESC;
-- 32.
SELECT deptno,ename,sal FROM emp ORDER BY deptno DESC , ename , sal DESC;
-- 33.
SELECT ename,sal, ROUND((sal*0.13),0) AS "BONUS",deptno FROM emp WHERE deptno IN(10);
-- 34.
SELECT ename,sal,NVL(comm,0), sal+NVL(comm,0) FROM emp ORDER BY 4 DESC; -- COALESE(sal+comm,sal) 가능.
-- 35.
SELECT ename,sal,TO_CHAR(ROUND((sal*0.15),1),'$999,999,999.0')AS "회비"
FROM emp WHERE sal BETWEEN 1500 AND 3000;
-- 36.
SELECT d.dname, COUNT(*) FROM emp e 
JOIN dept d ON e.deptno=d.deptno 
GROUP BY d.dname HAVING COUNT(*)>5;
-- 37.
SELECT job, SUM(sal) FROM emp 
GROUP BY job HAVING SUM(sal)>5000 AND job <> 'SALESMAN'                 -- !=
ORDER BY SUM(sal) DESC;
-- 38.
SELECT e.empno,e.ename, e.sal, s.grade FROM emp e 
JOIN salgrade s on e.sal >= s.losal AND e.sal <= s.hisal;               -- BETWEEN s.losal AND s.hisaㅣ 로 표현 가능.
-- 39.
SELECT deptno, COUNT(empno)AS"사원수", COUNT(comm)AS"커미션받은사원수" FROM emp 
GROUP BY deptno;
-- 40.
SELECT ename, deptno, 
DECODE(deptno, 10, '총무부',
               20, '개발부',
               30, '영업부'
) AS "부서명"
FROM emp;

SELECT ename,deptno,
CASE deptno WHEN 10 THEN '총무부'
             WHEN 20 THEN '개발부'
             WHEN 30 THEN '영업부'
                     ELSE '부서없음' 
END "부서명"
FROM emp;
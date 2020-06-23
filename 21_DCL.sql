-- DCL ( DATA CONTROL LANGUAGE )
-- 데이터의 사용권한을 관리
-- 관리자 계정에 접속한 뒤에 수행.
-- GRANT : 특정 사용자에게 수행 권한을 부여
-- REVOKE : 특정 사용자에게 수행 권한을 회수 및 박탈

-- 새 유저 만들기
CREATE USER John IDENTIFIED BY root;    -- 새 유저 John을 만들고 비번은 root
-- 위의 문장을 단순히 실행하면, 에러가 뜸. 관리자계정만이 가능한 권한.
-- Oracle-XE로 접속하여 실행 하면, 제대로 됨.

GRANT CREATE SESSION TO John;   -- 새 유저 John에게 접속 권한을 준다.
GRANT CREATE TABLE TO John;     -- 새 유저 John에게 테이블생성 권한을 준다.
CREATE TABLESPACE johnSpace     -- 테이블을 생성할 공간이 없기에 만들어 준다.
DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\john.dbf' SIZE 10M
AUTOEXTEND ON NEXT 5M;
-- DBF파일이 있는 경로를 지정해준다. 그리고 용량도 지정해준다. 자동으로 5M가 늘려주는 옵션도 추가.
-- 데이터 저장공간도 필요하기에 지정하는 명령어.

-- 존계정이 이 테이블스페이스를 사용할수 있도록
ALTER USER John DEFAULT TABLESPACE johnSpace;   -- 디폴트 존스페이스로
ALTER USER John QUOTA UNLIMITED ON johnSpace;   -- 테이블 스페이스 사용권한
-- ROLE 부여.
GRANT CONNECT, RESOURCE TO John;
-- CONNECT 롤은 접속 관련 권한들의 모음
-- RESOURCE는 객체,데이터(입력,수정,삭제,조회)권한. 테이블,뷰 등
-- John계정도 이제 가능.

-- DBA 롤은 사용자 권한이다.
-- GRANT DBA TO + 유저이름 으로 하면 된다.

-- 권한제거 및 회수.
REVOKE CREATE TABLE FROM JOHN;  -- 테이블을 생성할 권한을 뺏음. 존으로부터
REVOKE RESOURCE FROM JOHN;      -- 객체권한 관련 모두 제거.

-- 계정을 삭제
DROP USER JOHN CASCADE;
-- 계정 접속은 끊고, CASCADE는 반드시 붙여준다.

-- TABLE SPACE 삭제
DROP TABLESPACE johnSpace;

-- 현재 생성 계정들 확인
SELECT * FROM DBA_USERS;
SELECT * FROM ALL_USERS;

-- 사용자에게 부여된 시스템 권한 확인
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'HR';

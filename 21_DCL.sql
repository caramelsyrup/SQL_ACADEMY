-- DCL ( DATA CONTROL LANGUAGE )
-- �������� �������� ����
-- ������ ������ ������ �ڿ� ����.
-- GRANT : Ư�� ����ڿ��� ���� ������ �ο�
-- REVOKE : Ư�� ����ڿ��� ���� ������ ȸ�� �� ��Ż

-- �� ���� �����
CREATE USER John IDENTIFIED BY root;    -- �� ���� John�� ����� ����� root
-- ���� ������ �ܼ��� �����ϸ�, ������ ��. �����ڰ������� ������ ����.
-- Oracle-XE�� �����Ͽ� ���� �ϸ�, ����� ��.

GRANT CREATE SESSION TO John;   -- �� ���� John���� ���� ������ �ش�.
GRANT CREATE TABLE TO John;     -- �� ���� John���� ���̺����� ������ �ش�.
CREATE TABLESPACE johnSpace     -- ���̺��� ������ ������ ���⿡ ����� �ش�.
DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\john.dbf' SIZE 10M
AUTOEXTEND ON NEXT 5M;
-- DBF������ �ִ� ��θ� �������ش�. �׸��� �뷮�� �������ش�. �ڵ����� 5M�� �÷��ִ� �ɼǵ� �߰�.
-- ������ ��������� �ʿ��ϱ⿡ �����ϴ� ���ɾ�.

-- �������� �� ���̺������̽��� ����Ҽ� �ֵ���
ALTER USER John DEFAULT TABLESPACE johnSpace;   -- ����Ʈ �������̽���
ALTER USER John QUOTA UNLIMITED ON johnSpace;   -- ���̺� �����̽� ������
-- ROLE �ο�.
GRANT CONNECT, RESOURCE TO John;
-- CONNECT ���� ���� ���� ���ѵ��� ����
-- RESOURCE�� ��ü,������(�Է�,����,����,��ȸ)����. ���̺�,�� ��
-- John������ ���� ����.

-- DBA ���� ����� �����̴�.
-- GRANT DBA TO + �����̸� ���� �ϸ� �ȴ�.

-- �������� �� ȸ��.
REVOKE CREATE TABLE FROM JOHN;  -- ���̺��� ������ ������ ����. �����κ���
REVOKE RESOURCE FROM JOHN;      -- ��ü���� ���� ��� ����.

-- ������ ����
DROP USER JOHN CASCADE;
-- ���� ������ ����, CASCADE�� �ݵ�� �ٿ��ش�.

-- TABLE SPACE ����
DROP TABLESPACE johnSpace;

-- ���� ���� ������ Ȯ��
SELECT * FROM DBA_USERS;
SELECT * FROM ALL_USERS;

-- ����ڿ��� �ο��� �ý��� ���� Ȯ��
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'HR';
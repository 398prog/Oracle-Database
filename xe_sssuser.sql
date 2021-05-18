DROP TABLE dept;

CREATE TABLE dept(
 dept_id NUMBER(2) PRIMARY KEY,
 dept_name VARCHAR2(20) NOT NULL
);
CREATE TABLE emp (
 emp_id NUMBER(5) PRIMARY KEY,
 emp_pass VARCHAR2(10) NOT NULL,
 emp_name VARCHAR2(20) NOT NULL,
 gender NUMBER(1) NOT NULL,
 address VARCHAR2(30),
 birthday DATE,
 dept_id NUMBER(2) NOT NULL REFERENCES dept(dept_id)
);

ALTER TABLE dept DROP COLUMN note;

INSERT INTO dept VALUES (1,'������');
INSERT INTO dept VALUES (2,'�c�ƕ�');
INSERT INTO dept VALUES (3,'�o����');
INSERT INTO dept VALUES (4,'���ޕ�');
INSERT INTO emp VALUES (1,'1111','�R�c���Y',1,'��t��','2009/09/09',1);
INSERT INTO emp VALUES (2,'2222','��������',1,'��ʌ�','2009/09/10',1);
INSERT INTO emp VALUES (3,'3333','��؉Ԏq',2,'�����s','2009/09/10',2);
INSERT INTO emp VALUES (4,'4444','���X�ؗǎq',2,'��ʌ�','2009/09/14',3);

select * from dept;
select * from emp;

select dept_name from dept;
�@
INSERT INTO emp VALUES (5,'5555','���X�ؗǎq',2,'null',null,3);

COMMIT; 

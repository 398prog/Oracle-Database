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
select * from employee;

select dept_name from dept;
ALTER TABLE emp RENAME TO employee;
�@
INSERT INTO employee VALUES (5,'5555','���X�ؗǎq',2,'null',null,4);

select emp_id as id FROM employee;

select 
    DISTINCT emp_name,address 
FROM 
    employee;
    
select * from employee where dept_id = 1;

UPDATE employee SET emp_pass = '7777';
UPDATE employee SET emp_pass = '1111' where dept_id = '1';
update employee set address = 'null' where address = '�_�ސ쌧';

DELETE FROM employee Where emp_id = 4;

CREATE TABLE item
(item_id CHAR(4) PRIMARY KEY,
item_name VARCHAR2(100) NOT NULL,
category_id NUMBER NOT NULL,
sel_price NUMBER,
pur_price NUMBER,
reg_date DATE);

INSERT INTO item VALUES ('0001','�V���c',1,1000,500,'2009-09-20');
INSERT INTO item VALUES ('0002','�z�b�`�L�X',2,500,320,'2009-09-11');
INSERT INTO item VALUES ('0003','�Z�[�^�[',1,4000,2800,NULL);
INSERT INTO item VALUES ('0004','�',3,3000,2800,'2009-09-20');
INSERT INTO item VALUES ('0005','�t���C�p��',3,5000,2800,'2009-01-15');
INSERT INTO item VALUES ('0006','�t�H�[�N',3,NULL,2800,'2009-09-20');
INSERT INTO item VALUES ('0007','�X�v�[��',3,790,2800,'2008-04-28');
INSERT INTO item VALUES ('0008','�{�[���y��',2,NULL,2800,'2009-11-11');
COMMIT;

select * from item where category_id = 3
or sel_price >= 3000;

select * from item where not sel_price >= 1000;
select item_name from item where item_name like '%�p_';

SELECT category_id, COUNT(item_id)
 FROM Item
GROUP BY category_id;



select item_name, sel_price, reg_date
from item 
where reg_date BETWEEN '2008/04/28' and '2009/09/11';

SELECT item_name, sel_price 
FROM item WHERE sel_price IN (500,790,1000);

SELECT pur_price, COUNT(item_id)
 FROM Item
WHERE category_id = 3
GROUP BY pur_price;

SELECT category_id, COUNT(item_id)
 FROM Item
GROUP BY category_id
HAVING COUNT(*) = 2;

select count(item_id) from item;

select *
    FROM Item
ORDER BY sel_price DESC;

select *
    FROM Item
ORDER BY sel_price ASC;

select *
    FROM Item
ORDER BY pur_price DESC,item_id ASC;


COMMIT; 

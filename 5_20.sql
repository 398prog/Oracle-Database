
CREATE TABLE shop_item
(shop_id CHAR(4) NOT NULL,
shop_name VARCHAR2(200) NOT NULL,
item_id CHAR(4) NOT NULL,
quantity NUMBER NOT NULL,
PRIMARY KEY (shop_id, item_id));

INSERT INTO shop_item (shop_id,shop_name,item_id,quantity) VALUES
('000A','����','0001',30);
INSERT INTO shop_item (shop_id,shop_name,item_id,quantity) VALUES
('000A','����','0002',50);
INSERT INTO shop_item (shop_id,shop_name,item_id,quantity) VALUES
('000B','���','0002',30);
INSERT INTO shop_item (shop_id,shop_name,item_id,quantity) VALUES
('000B','���','0006',10);
INSERT INTO shop_item (shop_id,shop_name,item_id,quantity) VALUES
('000C','���','0003',20);
INSERT INTO shop_item (shop_id,shop_name,item_id,quantity) VALUES
('000C','���','0007',70);
INSERT INTO shop_item (shop_id,shop_name,item_id,quantity) VALUES
('000D','����','0001',50);

CREATE TABLE item
(item_id CHAR(4) NOT NULL,
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

--�e�[�u���쐬
CREATE TABLE stock_item
(house_id CHAR(4) NOT NULL,
item_id CHAR(4) NOT NULL,
stock NUMBER NOT NULL,
PRIMARY KEY(house_id, item_id)
);
--�f�[�^�o�^
INSERT INTO stock_item (house_id, item_id, stock) VALUES('S001', '0001', 0);
INSERT INTO stock_item (house_id, item_id, stock) VALUES('S001', '0002',120);
INSERT INTO stock_item (house_id, item_id, stock) VALUES('S001', '0003',200);
INSERT INTO stock_item (house_id, item_id, stock) VALUES('S001', '0004',3);
INSERT INTO stock_item (house_id, item_id, stock) VALUES('S001', '0005',0);
INSERT INTO stock_item (house_id, item_id, stock) VALUES('S001', '0006',99);
INSERT INTO stock_item (house_id, item_id, stock) VALUES('S001', '0007',999);
INSERT INTO stock_item (house_id, item_id, stock) VALUES('S001', '0008',200);
INSERT INTO stock_item (house_id, item_id, stock) VALUES('S002', '0001',10);
INSERT INTO stock_item (house_id, item_id, stock) VALUES('S002', '0002',25);
INSERT INTO stock_item (house_id, item_id, stock) VALUES('S002', '0003',34);
INSERT INTO stock_item (house_id, item_id, stock) VALUES('S002', '0004',19);
INSERT INTO stock_item (house_id, item_id, stock) VALUES('S002', '0005',99);
INSERT INTO stock_item (house_id, item_id, stock) VALUES('S002', '0006',0);
INSERT INTO stock_item (house_id, item_id, stock) VALUES('S002', '0007',0);
INSERT INTO stock_item (house_id, item_id, stock) VALUES('S002', '0008',18);
COMMIT;

--�e�[�u���̍쐬
CREATE TABLE item2
(item_id CHAR(4) PRIMARY KEY,
item_name VARCHAR2(100) NOT NULL,
category_id NUMBER NOT NULL,
sel_price NUMBER,
pur_price NUMBER,
reg_date DATE
);
--���R�[�h�̓o�^
INSERT INTO item2 VALUES('0001','�V���c',1,1000,500,'2009-09-20');
INSERT INTO item2 VALUES('0002','�z�b�`�L�X',2,500,320,'2009-09-11');
INSERT INTO item2 VALUES('0009','�}�t���[',1,800,500,NULL);
COMMIT;

CREATE VIEW item_view AS
SELECT si.shop_id, si.shop_name, si.item_id, i.item_name, i.sel_price,
si.quantity, sti.stock
FROM shop_item si INNER JOIN item i ON si.item_id = i.item_id
INNER JOIN stock_item sti ON si.item_id = sti.item_id
WHERE sti.house_id = 'S001';

SELECT shop_id, shop_name, item_id, item_name, sel_price, quantity
FROM (SELECT si.shop_id, si.shop_name, si.item_id, i.item_name,
i.sel_price, si.quantity
FROM shop_item si INNER JOIN item i ON si.item_id = i.item_id);

--WHERE ��ɏW��֐��͎g���Ȃ�
SELECT item_id, item_name, sel_price
FROM Item
WHERE sel_price > (SELECT AVG(sel_price) FROM Item);

SELECT item_id, item_name, sel_price
FROM item i1
WHERE sel_price > (SELECT AVG(sel_price)
FROM item i2
WHERE i1.category_id = i2.category_id
GROUP BY category_id);


CREATE SEQUENCE seq_dept
START WITH 5
NOCACHE;

INSERT INTO dept values(seq_dept.NEXTVAL,'�l����');
COMMIT;
SELECT dept_id, dept_name FROM dept;


SELECT item_id, item_name
FROM item
UNION
SELECT item_id, item_name
FROM item2;

SELECT si.shop_id, si.shop_name, si.item_id, i.item_name, i.sel_price,
si.quantity, sti.stock
FROM shop_item si INNER JOIN item i ON si.item_id = i.item_id
INNER JOIN stock_item sti ON si.item_id = sti.item_id
WHERE sti.house_id = 'S001';

select * from shop_item;
select * from item;

SELECT
si.shop_id,
si.shop_name,
si.item_id,
i.item_name,
i.sel_price,
si.quantity
FROM shop_item si INNER JOIN item i
ON si.item_id = i.item_id;



SELECT
 si.shop_id,
 si.shop_name,
 si.item_id,
 i.item_name,
 i.sel_price,
 si.quantity
FROM item i LEFT OUTER JOIN shop_item si
ON i.item_id = si.item_id;




COMMIT;
DROP database EMPLOYEE;
CREATE database EMPLOYEE;
USE EMPLOYEE;
CREATE TABLE SALES(
product_id int,sells_price float,quantity int ,state varchar(30)
);
insert into sales values
(121,320.0,3,'california'),
(121,320.0,6,'Taxes'),
(121,320.0,4,'Alaska'),
(123,290.0,2,'Taxes'),
(123,290.00,7,'california'),
(123,290.00,7,'Washington'),
(121,320.0,7,'Ohio'),
(121,320.0,2,'Arizona'),
(121,290.0,8,'Colorado');
SHOW databases;
SELECT *FROM SALES;
select product_id ,sum (sells_price*quantity) as revenue
from sales group by product_id;
SELECT product_id, 
       SUM(sells_price * quantity) AS revenue
FROM SALES
GROUP BY product_id
LIMIT 0, 1000;
SHOW databases;
USE EMPLOYEE;
describe SALES;
CREATE TABLE C_PRODUCT(PRODUCT_ID INT,COST_PRICE FLOAT);
INSERT INTO C_PRODUCT VALUES(121,270.0),
(123,250.0);
SELECT 
    C.PRODUCT_ID, -- Add a comma here after PRODUCT_ID
    ((S.SELLS_PRICE - C.COST_PRICE) * S.QUANTITY) AS PROFIT
FROM 
    SELLS AS S 
INNER JOIN 
    C_PRODUCT AS C
ON 
    S.PRODUCT_ID = C.PRODUCT_ID -- Replace `WHERE` with `ON` for proper JOIN syntax
GROUP BY 
    C.PRODUCT_ID;
    
    



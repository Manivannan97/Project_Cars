-- Data Definition Language (DDL) - CREATE, ALTER, Truncate, RENAME, and TRUNCATE commands under DDL.

CREATE DATABASE PROJECT;  -- CREATING DATABASE
SHOW DATABASES; -- WILL SHOW ALL DATABASE
USE PROJECT;   -- SELECTED DATABASE

-- CREATING TABLES 

CREATE TABLE CAR_INFO
(CAR_ID INT, 
CAR_NAME VARCHAR(100),
LOCATION VARCHAR(100),
MODEL_YEAR YEAR,
SEATS INT,
OWNER_TYPE VARCHAR(100));

CREATE TABLE ENGINE_SPEC
(FUEL_TYPE VARCHAR(100),
TRANSMISSION VARCHAR(100),
MILEAGE_KMPL FLOAT,
ENGINE_DISPLACEMENT INT,
POWER_BHP FLOAT,
CAR_ID INT);

CREATE TABLE CAR_PRICE
(CAR_ID INT,
OWNER_TYPE VARCHAR(100),
KILOMETER INT,
PRICE INT);

-- TO DESCRIBE TABLES
DESC CAR_INFO;
DESC ENGINE_SPEC;
DESC CAR_PRICE;


ALTER TABLE CAR_INFO ADD CURRENT_STATUS VARCHAR(50); -- TO ADD COLUMN IN TABLE

ALTER TABLE CAR_INFO DROP COLUMN CURRENT_STATUS; -- TO DROP COLUMN IN TABLE

ALTER TABLE CAR_INFO MODIFY CAR_ID INT PRIMARY KEY AUTO_INCREMENT; -- TO MODIFY COLUMN IN TABLE AND USED CONSTRAINTS

TRUNCATE TABLE CAR_INFO; -- TO DELETE ALL ROWS FROM TABLE

RENAME TABLE CAR_INFO TO CARS_INFO;  -- TO RENAME TABLE

DROP DATABASE PROJECT;  -- TO DELETE DATABASE

DROP TABLE CAR_INFO;  -- TO DELETE TABLE

-- Data Manipulation Language (DML) -- INSERT, UPDATE, DELETE

INSERT INTO CAR_INFO(CAR_NAME,LOCATION,MODEL_YEAR,SEATS,OWNER_TYPE)  -- TO INSERT VALUES IN TABLE
VALUES('MCLAREN','CHENNAI',2023,2,'FIRST');

UPDATE CAR_INFO SET MODEL_YEAR = 2024 WHERE CAR_NAME = 'MCLAREN'; -- TO UPDATE VALUES IN TABLE

DELETE FROM CAR_INFO WHERE CAR_NAME = 'MCLAREN';  -- TO DELETE VALUES FROM TABLE.alter

-- Data Query Language (DQL) -  DQL is focused on the SELECT statement, which retrieves data from one or more database tables.

select * from CAR_INFO;  -- TO VIEW ALL INFO FROM TABLE

SELECT CAR_NAME,MODEL_YEAR FROM CAR_INFO;  -- TO VIEW INFO FROM SPECIFIC COLUMN

-- ARITHMETIC OPERATORS

SELECT CAR_ID,PRICE, PRICE+5000 AS NEW_PRICE FROM CAR_PRICE;  -- ADDITION

SELECT CAR_ID,PRICE, PRICE-5000 AS DISCOUNT_PRICE FROM CAR_PRICE;  -- SUBTRACTION

SELECT CAR_ID,PRICE, PRICE*2 FROM CAR_PRICE; -- MULTIPLICATION

SELECT CAR_ID,PRICE, PRICE/2 FROM CAR_PRICE;  -- DIVISION

SELECT CAR_ID,PRICE, PRICE%3 AS NEW_PRICE FROM CAR_PRICE;  -- MODULO OR REMINDER

-- COMPARISON OPERATORS

SELECT CAR_NAME, LOCATION FROM CAR_INFO WHERE MODEL_YEAR = 2010;   -- EQUAL TO 

SELECT CAR_NAME, LOCATION FROM CAR_INFO WHERE MODEL_YEAR != 2010;  -- NOT EQUAL TO

SELECT CAR_NAME, LOCATION FROM CAR_INFO WHERE MODEL_YEAR < 2010; -- LESS THAN

SELECT CAR_NAME, LOCATION FROM CAR_INFO WHERE MODEL_YEAR > 2010; -- GREATER THAN

SELECT CAR_NAME, LOCATION FROM CAR_INFO WHERE MODEL_YEAR <= 2010;  --  LESSER THAN OR EQUAL TO

SELECT CAR_NAME, LOCATION FROM CAR_INFO WHERE MODEL_YEAR >= 2010;  -- GREATER THAN EQUAL TO

-- Logical Operators

SELECT CAR_NAME, LOCATION FROM CAR_INFO WHERE MODEL_YEAR = 2010 AND LOCATION = 'CHENNAI';  -- AND OPERATOR

SELECT CAR_NAME,MODEL_YEAR, LOCATION FROM CAR_INFO WHERE MODEL_YEAR = 2010 OR LOCATION = 'CHENNAI';  -- OR OPERATOR

SELECT CAR_NAME, LOCATION FROM CAR_INFO WHERE NOT LOCATION = 'CHENNAI';  -- NOT OPERATOR

SELECT * FROM CAR_INFO WHERE MODEL_YEAR IS NULL; -- TO GET NULL VALUES

SELECT * FROM CAR_INFO WHERE MODEL_YEAR IS NOT NULL; -- TO GET NOT NULL VALUES

SELECT * FROM CAR_INFO WHERE MODEL_YEAR BETWEEN 2008 AND 2010;  -- TO GET VALUES WITHIN THE RANGE

SELECT * FROM CAR_INFO WHERE MODEL_YEAR NOT BETWEEN 2008 AND 2010;  -- TO GET VALUES NOT WITHIN THE RANGE

SELECT * FROM CAR_INFO WHERE CAR_ID IN (9,46,393,4299);  -- TO GET VALUE IN LIST

SELECT * FROM CAR_INFO WHERE CAR_ID NOT IN (9,46,393,4299);  -- TO GET VALUE NOT IN LIST

Select * FROM CAR_INFO WHERE LOCATION LIKE 'CH%'; -- TO GET VALUE LIKE INPUT
Select * FROM CAR_INFO WHERE LOCATION LIKE '%TA';
Select * FROM CAR_INFO WHERE LOCATION LIKE '%ELH%';
Select * FROM CAR_INFO WHERE LOCATION LIKE '_U__';

Select * FROM CAR_INFO WHERE LOCATION NOT LIKE 'MU%'; -- TO GET VALUE NOT LIKE INPUT
Select * FROM CAR_INFO WHERE LOCATION NOT LIKE '%HI';
Select * FROM CAR_INFO WHERE LOCATION NOT LIKE '%BAD%';
Select * FROM CAR_INFO WHERE LOCATION NOT LIKE '__L__';

-- Data Control Language (DCL)

GRANT SELECT, UPDATE ON CAR_PRICE TO SALESMAN; -- TO GRANT PERMISSION FOR EDITING REQUIRED DATA

REVOKE SELECT, UPDATE ON CAR_PRICE FROM SALESMAN; -- TO REMOVE PERMISSION FOR EDITING DATA

-- Aggregating and Grouping Data

SELECT * FROM CAR_INFO WHERE LOCATION = 'PUNE';  -- USING WHERE CLAUSE

SELECT * FROM CAR_INFO; -- USING FROM CLAUSE

SELECT * FROM CAR_INFO ORDER BY MODEL_YEAR;       -- TO ORDER DATA IN ASCENDING
SELECT * FROM CAR_INFO ORDER BY MODEL_YEAR DESC;  -- TO ORDER DATA IN DESCENDING 

-- Aggregate Functions

SELECT OWNER_TYPE,SUM(PRICE) AS TOTAL_PRICE FROM CAR_PRICE GROUP BY OWNER_TYPE;  -- TO SUM THE VALUE
SELECT OWNER_TYPE,AVG(PRICE) AS AVERAGE_PRICE FROM CAR_PRICE GROUP BY OWNER_TYPE; -- TO CHECK AVERAGE VALUE
SELECT LOCATION,COUNT(CAR_NAME) AS NO_OF_CARS_AVAILABLE FROM CAR_INFO GROUP BY LOCATION;  -- TO COUNT DATA
SELECT OWNER_TYPE,MAX(PRICE) AS COSTLIEST_CAR FROM CAR_PRICE GROUP BY OWNER_TYPE;  -- TO CHECK MAX VALUE
SELECT OWNER_TYPE,MIN(PRICE) AS CHEAPEST_CAR FROM CAR_PRICE GROUP BY OWNER_TYPE;  -- TO CHECK MIN VALUE

SELECT OWNER_TYPE,AVG(PRICE) AS AVERAGE_PRICE FROM CAR_PRICE GROUP BY OWNER_TYPE HAVING AVERAGE_PRICE > 500000;  -- USING HAVING CLAUSE TO FILTER AGGREGATED VALUE

SELECT * FROM CAR_INFO ORDER BY MODEL_YEAR DESC limit 10;  -- USING LIMIT CLAUSE TO CHECK REQUIRED DATA

-- INNER JOIN USING ON CLAUSE
SELECT 
 C.CAR_NAME, 
 P.PRICE
FROM
 CAR_INFO C
INNER JOIN CAR_PRICE P ON C.CAR_ID = P.CAR_ID;

-- USING INNER JOIN WITH USING() CLAUSE
SELECT 
 C.CAR_NAME, 
 P.PRICE
FROM
 CAR_INFO C
INNER JOIN CAR_PRICE P USING (CAR_ID);

-- USING LEFT JOIN WITH USING() CLAUSE
SELECT 
 C.CAR_NAME, 
 P.PRICE
FROM
 CAR_INFO C
LEFT JOIN CAR_PRICE P USING (CAR_ID);

-- USING RIGHT JOIN WITH USING() CLAUSE
SELECT 
 C.CAR_NAME, 
 P.PRICE
FROM
 CAR_INFO C
RIGHT JOIN CAR_PRICE P USING (CAR_ID);




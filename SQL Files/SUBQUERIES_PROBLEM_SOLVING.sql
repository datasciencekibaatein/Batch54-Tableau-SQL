create database subqueries;
use subqueries;

-- Create Tables
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    manager_id INT,
    hire_date DATE
);

CREATE TABLE Products (
    prod_id INT PRIMARY KEY,
    name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    emp_id INT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

CREATE TABLE Order_Items (
    item_id INT PRIMARY KEY,
    order_id INT,
    prod_id INT,
    quantity INT,
    unit_price DECIMAL(10,2)
);

-- Insert Data
INSERT INTO Departments VALUES (1, 'Sales'), (2, 'IT'), (3, 'HR'), (4, 'Marketing');

INSERT INTO Employees VALUES 
(101, 'Alice', 90000, 1, NULL, '2020-01-15'),
(102, 'Bob', 80000, 1, 101, '2021-03-10'),
(103, 'Charlie', 75000, 2, NULL, '2019-05-20'),
(104, 'David', 60000, 2, 103, '2022-02-01'),
(105, 'Eve', 95000, 4, NULL, '2018-11-12');

INSERT INTO Products VALUES 
(501, 'Laptop', 'Electronics', 1200, 50),
(502, 'Mouse', 'Electronics', 25, 200),
(503, 'Chair', 'Furniture', 150, 30),
(504, 'Desk', 'Furniture', 300, 15);

INSERT INTO Orders VALUES 
(1001, 101, 1, '2023-01-01', 1225),
(1002, 102, 2, '2023-01-05', 25),
(1003, 101, 3, '2023-02-10', 300);

INSERT INTO Order_Items VALUES 
(1, 1001, 501, 1, 1200),
(2, 1001, 502, 1, 25),
(3, 1002, 502, 1, 25),
(4, 1003, 504, 1, 300);

-- SCALER SUBQUERIES
-- Find all employees who earn more than the average salary of the entire company.

SELECT
	NAME,
    SALARY
FROM EMPLOYEES
WHERE SALARY > 
	(SELECT
		AVG(SALARY) AVG_SALARY
	FROM EMPLOYEES);
    
    SELECT * FROM PRODUCTS;
-- Find the product name with the highest price.

SELECT
	NAME ,
    PRICE
FROM PRODUCTS
WHERE PRICE = (SELECT MAX(PRICE) FROM PRODUCTS);

-- FIND EMPLOYEE WHO HAS HIRED MOST RECENTLY
SELECT * FROM EMPLOYEES;

SELECT
	NAME,
    HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE = (SELECT MAX(HIRE_DATE) FROM EMPLOYEES);

-- List orders where the total amount is greater than the average order total.
SELECT ORDER_ID,TOTAL_AMOUNT FROM ORDERS WHERE TOTAL_AMOUNT > (SELECT AVG(TOTAL_AMOUNT) FROM ORDERS);


-- MULTI ROWS SUBQUERIES
-- Find departments that have at least one employee earning more than 85,000.
SELECT
	DEPT_NAME
FROM DEPARTMENTS
WHERE DEPT_ID IN 
    (SELECT
		DEPT_ID
	FROM EMPLOYEES
	WHERE SALARY > 85000);

-- Find products that have never been ordered.
SELECT * FROM ORDERS;
SELECT * FROM ORDER_ITEMS;
SELECT * FROM PRODUCTS;

SELECT 
	*
FROM PRODUCTS
WHERE PROD_ID NOT IN
	(SELECT 
		DISTINCT PROD_ID 
	FROM ORDER_ITEMS);
    
-- Find employees who work in the 'Sales' or 'IT' departments using a subquery.
SELECT
	NAME
FROM EMPLOYEES 
WHERE DEPT_ID IN 
	(SELECT
		DEPT_ID
	FROM DEPARTMENTS
	WHERE DEPT_NAME IN ('SALES','IT'));

-- Find products whose price is greater than the price of all products in the 'Furniture' category.
SELECT
	NAME,
    PRICE
FROM PRODUCTS
WHERE PRICE
>	ALL(SELECT
		PRICE
	FROM PRODUCTS
	WHERE CATEGORY = 'FURNITURE');
	
-- Find employees who have handled at least one order.
SELECT * FROM ORDERS; 
SELECT
	NAME
FROM EMPLOYEES 
WHERE EMP_ID
IN
(
SELECT
	EMP_ID
FROM ORDERS);


-- CORELATED SUBQUERIES
-- Find employees who earn more than the average salary of their own department.
SELECT
	E1.NAME,
    E1.SALARY
FROM EMPLOYEES E1
WHERE E1.SALARY >
	(SELECT
		AVG(E2.SALARY)
	FROM EMPLOYEES E2 WHERE E1.DEPT_ID = E2.DEPT_ID);
    
-- Find products that are priced higher than the average price of products in the same category.
SELECT * FROM PRODUCTS;

SELECT
	P1.NAME,
    P1.PRICE
FROM PRODUCTS P1
WHERE P1.PRICE>
	(SELECT 
		AVG(P2.PRICE)
	FROM PRODUCTS P2 WHERE P2.CATEGORY = P1.CATEGORY);
    
-- List each department and the name of the highest-paid employee in that department.
SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES;

SELECT
	E1.NAME,
    E1.DEPT_ID
FROM EMPLOYEES E1
WHERE E1.SALARY =
	(SELECT
		MAX(E2.SALARY)
	FROM EMPLOYEES E2 WHERE E2.DEPT_ID = E1.DEPT_ID);

-- SELECT SUBQUERIES

-- Show each employee's name along with the total number of orders they have handled.

SELECT * FROM ORDERS;

SELECT 
	NAME, (
    SELECT COUNT(ORDER_ID) FROM ORDERS WHERE ORDERS.EMP_ID = EMPLOYEES.EMP_ID) AS ORDER_COUNT
FROM 
	EMPLOYEES;
    
-- FROM SUBQUERIES
-- Find the average of the total sales made by each employee.

SELECT
	AVG(T.SALE_DONE)
FROM (SELECT 
		EMP_ID,
		SUM(TOTAL_AMOUNT) SALE_DONE
	FROM ORDERS 
	GROUP BY EMP_ID) T;


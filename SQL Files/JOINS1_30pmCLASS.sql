CREATE DATABASE JOINSCLASS;
USE JOINSCLASS;


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);



INSERT INTO customers (customer_id, name, email, city) VALUES
(1, 'Alice Smith', 'alice@example.com', 'New York'),
(2, 'Bob Johnson', 'bob@example.com', 'Los Angeles'),
(3, 'Carol Davis', 'carol@example.com', 'Chicago'),
(4, 'David Brown', 'david@example.com', 'Houston'),
(5, 'Eva Wilson', 'eva@example.com', 'Phoenix'),
(6, 'Frank Taylor', 'frank@example.com', 'Philadelphia'),
(7, 'Grace Anderson', 'grace@example.com', 'San Antonio'),
(8, 'Henry Thomas', 'henry@example.com', 'San Diego'),
(9, 'Ivy Jackson', 'ivy@example.com', 'Dallas'),
(10, 'Jack White', 'jack@example.com', 'San Jose'),
(11, 'Kara Hall', 'kara@example.com', 'Austin'),
(12, 'Leo Allen', 'leo@example.com', 'Jacksonville'),
(13, 'Mia Young', 'mia@example.com', 'Fort Worth'),
(14, 'Nate Hernandez', 'nate@example.com', 'Columbus'),
(15, 'Olivia King', 'olivia@example.com', 'Charlotte'),
(16, 'Paul Wright', 'paul@example.com', 'San Francisco'),
(17, 'Queen Lee', 'queen@example.com', 'Indianapolis'),
(18, 'Ryan Scott', 'ryan@example.com', 'Seattle'),
(19, 'Sara Green', 'sara@example.com', 'Denver'),
(20, 'Tom Adams', 'tom@example.com', 'Washington');

INSERT INTO CUSTOMERS VALUES(22,'HARRY','HARRY@EXAMPLE.COM','COLUMBUS');


SELECT * FROM CUSTOMERS;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    status VARCHAR(20)
);


DROP TABLE CUSTOMERS;
DROP TABLE ORDERS;

INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (1, 4, '2025-07-14', 290.82, 'Pending');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (2, 5, '2025-07-02', 95.91, 'Shipped');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (3, 3, '2025-07-11', 188.33, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (4, 15, '2025-07-30', 314.60, 'Cancelled');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (5, 18, '2025-07-12', 434.07, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (6, 1, '2025-07-14', 299.76, 'Cancelled');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (7, 10, '2025-07-06', 65.25, 'Shipped');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (8, 13, '2025-07-13', 386.56, 'Pending');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (9, 9, '2025-07-20', 228.61, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (10, 7, '2025-07-24', 294.28, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (11, 6, '2025-07-25', 55.01, 'Cancelled');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (12, 2, '2025-07-11', 285.93, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (13, 12, '2025-07-13', 194.77, 'Pending');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (14, 4, '2025-07-09', 341.18, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (15, 11, '2025-07-27', 87.44, 'Pending');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (16, 20, '2025-07-11', 192.38, 'Shipped');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (17, 16, '2025-07-21', 268.43, 'Cancelled');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (18, 2, '2025-07-06', 273.53, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (19, 14, '2025-07-02', 166.59, 'Shipped');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (20, 18, '2025-07-20', 495.62, 'Pending');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (21, 3, '2025-07-07', 310.93, 'Cancelled');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (22, 19, '2025-07-23', 144.89, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (23, 7, '2025-07-27', 167.85, 'Pending');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (24, 8, '2025-07-05', 475.41, 'Cancelled');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (25, 5, '2025-07-24', 378.62, 'Pending');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (26, 13, '2025-07-13', 349.79, 'Shipped');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (27, 8, '2025-07-17', 416.01, 'Shipped');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (28, 1, '2025-07-07', 299.84, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (29, 17, '2025-07-03', 154.28, 'Cancelled');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (30, 6, '2025-07-22', 93.05, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (31, 20, '2025-07-29', 234.82, 'Shipped');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (32, 19, '2025-07-28', 402.46, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (33, 10, '2025-07-23', 80.60, 'Pending');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (34, 12, '2025-07-19', 477.61, 'Pending');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (35, 16, '2025-07-14', 68.79, 'Cancelled');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (36, 11, '2025-07-18', 316.50, 'Shipped');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (37, 15, '2025-07-16', 173.96, 'Pending');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (38, 17, '2025-07-08', 347.79, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (39, 9, '2025-07-09', 448.02, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (40, 14, '2025-07-25', 230.96, 'Shipped');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (41, 18, '2025-07-06', 455.48, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (42, 9, '2025-07-28', 215.40, 'Shipped');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (43, 7, '2025-07-10', 119.83, 'Pending');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (44, 15, '2025-07-11', 495.95, 'Cancelled');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (45, 13, '2025-07-04', 325.31, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (46, 4, '2025-07-16', 132.88, 'Shipped');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (47, 3, '2025-07-07', 61.96, 'Cancelled');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (48, 12, '2025-07-18', 144.75, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (49, 2, '2025-07-29', 377.38, 'Delivered');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (50, 11, '2025-07-03', 452.06, 'Cancelled');

INSERT INTO ORDERS(ORDER_ID, CUSTOMER_ID,ORDER_DATE,AMOUNT,STATUS) VALUES(51,20,'2025-12-11',567,'DELIVERED');
INSERT INTO ORDERS(ORDER_ID, CUSTOMER_ID,ORDER_DATE,AMOUNT,STATUS) VALUES(52,21,'2025-12-11',567,'DELIVERED');

SELECT
    STATUS,
    SUM(AMOUNT) REVENUE
FROM 
    ORDERS
GROUP BY STATUS;


-- INNER JOIN
-- FIND THE SPENDING OF EACH CUSTOMER

SELECT
    C.NAME,
    SUM(O.AMOUNT) REVENUE
FROM 
    ORDERS O
INNER JOIN 
    CUSTOMERS C
ON O.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.NAME;


SELECT
    *
FROM 
    ORDERS O 
INNER JOIN 
    CUSTOMERS C 
ON O.CUSTOMER_ID = C.CUSTOMER_ID;


-- LEFT JOIN
SELECT
    *
FROM 
    ORDERS O 
LEFT JOIN 
    CUSTOMERS C
ON O.CUSTOMER_ID = C.CUSTOMER_ID;

-- RIGHT JOIN

SELECT
    *
FROM 
    ORDERS O 
RIGHT JOIN 
    CUSTOMERS C
ON O.CUSTOMER_ID = C.CUSTOMER_ID;

-- FULL JOIN

SELECT
    *
FROM 
    ORDERS O 
FULL JOIN 
    CUSTOMERS C
ON O.CUSTOMER_ID = C.CUSTOMER_ID;


-- --------------------------------------------------------

CREATE TABLE PRODUCT(
PID INT PRIMARY KEY,
PRODUCT_NAME VARCHAR(10));

INSERT INTO PRODUCT VALUES(1,'KEYBOARD'),(2,'MONITOR'),(3,'SSD'),(4,'MOUSE');
INSERT INTO PRODUCT VALUES(5,'HDD');

CREATE TABLE P_ORDERS(
OID INT PRIMARY KEY,
PID INT,
AMOUNT INT);

INSERT INTO P_ORDERS VALUES(1,2,450),(2,1,563),(3,1,655),(4,3,234),(5,4,573),(6,2,73),(7,1,564),(8,3,234),(9,3,763),(10,4,953);

INSERT INTO P_ORDERS VALUES(11,6,345);

SELECT*FROM PRODUCT;
SELECT * FROM P_ORDERS;

-- INNER
SELECT
*
FROM
P_ORDERS
INNER JOIN PRODUCT
ON P_ORDERS.PID = PRODUCT.PID;

-- LEFT JOIN
SELECT
*
FROM
P_ORDERS
LEFT JOIN PRODUCT
ON P_ORDERS.PID = PRODUCT.PID;

-- RIGHT JOIN
SELECT
*
FROM
P_ORDERS
RIGHT JOIN PRODUCT
ON P_ORDERS.PID = PRODUCT.PID;

-- FULL JOIN
SELECT
*
FROM
P_ORDERS
FULL JOIN PRODUCT
ON P_ORDERS.PID = PRODUCT.PID;

-- CROSS JOIN

SELECT 
*
FROM P_ORDERS
CROSS JOIN 
PRODUCT;
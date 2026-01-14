USE JOINSCLASS;

-- You work for a shopping platform. You need to analyze customers, orders, and which customers haven't ordered yet.
-- CREATE TABLES
CREATE TABLE customers (
 customer_id INT PRIMARY KEY,
 customer_name VARCHAR(50),
 city VARCHAR(50)
);
CREATE TABLE orders (
 order_id INT PRIMARY KEY,
 customer_id INT,
 order_date DATE,
 amount DECIMAL(10,2),
 FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- INSERT DATA
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Rohit', 'Bangalore'),
(4, 'Neha', 'Delhi'),
(5, 'Kunal', 'Chennai');
INSERT INTO orders VALUES
(101, 1, '2025-01-10', 1200.50),
(102, 3, '2025-01-12', 450.00),
(103, 3, '2025-01-14', 780.25),
(104, 1, '2025-01-16', 999.00),
(105, 2, '2025-01-18', 650.00);
-- READ DATA
SELECT * FROM ORDERS;
SELECT * FROM CUSTOMERS;


-- JOIN QUESTIONS
-- 1. List all customers with their orders (including customers with no orders).
SELECT
	O.ORDER_ID,
	O.CUSTOMER_ID,
	C.CUSTOMER_NAME,
	O.AMOUNT,
	C.CITY
FROM ORDERS O
RIGHT JOIN CUSTOMERS C
ON C.CUSTOMER_ID = O.CUSTOMER_ID;

-- 2. Show customers who never placed any order.
SELECT
	C.CUSTOMER_NAME
FROM ORDERS O
RIGHT  JOIN CUSTOMERS C
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.CUSTOMER_ID IS NULL;
-- 3. Show total amount spent by each customer.
SELECT
	O.CUSTOMER_ID,
	SUM(O.AMOUNT) SPENDING
FROM ORDERS O
INNER JOIN CUSTOMERS C
ON O.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY O.CUSTOMER_ID;
-- 4. Get details of orders placed by customers from Delhi.
SELECT
	O.ORDER_ID,
	O.CUSTOMER_ID,
	C.CUSTOMER_NAME,
	O.AMOUNT,
	C.CITY
FROM ORDERS O
INNER JOIN CUSTOMERS C
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE C.CITY ='DELHI';
-- 5. Show customer name, order date, and order amount — sorted by highest order value.
SELECT
	C.CUSTOMER_NAME,
	O.AMOUNT,
	O.ORDER_DATE
FROM ORDERS O
INNER JOIN CUSTOMERS C
ON C.CUSTOMER_ID = O.CUSTOMER_ID
ORDER BY O.AMOUNT DESC;



-- ------------------------------------------------
-- CREATE TABLES
CREATE TABLE students (
 student_id INT PRIMARY KEY,
 student_name VARCHAR(50),
 branch VARCHAR(50)
);
CREATE TABLE courses (
 course_id INT PRIMARY KEY,
 course_name VARCHAR(50),
 credits INT
);
CREATE TABLE enrollment (
 student_id INT,
 course_id INT,
 semester VARCHAR(10),
 PRIMARY KEY(student_id, course_id),
 FOREIGN KEY(student_id) REFERENCES students(student_id),
 FOREIGN KEY(course_id) REFERENCES courses(course_id)
);
-- INSERT DATA
INSERT INTO students VALUES
(1, 'Dhruv', 'CSE'),
(2, 'Sneha', 'IT'),
(3, 'Karan', 'ECE'),
(4, 'Megha', 'CSE'),
(5, 'Arjun', 'MECH');
INSERT INTO courses VALUES
(101, 'DBMS', 4),
(102, 'OS', 3),
(103, 'Networks', 4),
(104, 'Python', 3);
INSERT INTO enrollment VALUES
(1, 101, 'Sem1'),
(1, 102, 'Sem1'),
(2, 103, 'Sem2'),
(3, 101, 'Sem1'),
(3, 104, 'Sem3');
-- JOIN QUESTIONS
-- 1. Show all students with enrolled courses. Include students not enrolled.
SELECT
	*
FROM ENROLLMENT E
INNER JOIN COURSES C
ON E.COURSE_ID = C.course_id
RIGHT JOIN STUDENTS S
ON E.STUDENT_ID = S.STUDENT_ID;
-- 2. Find students who have not enrolled in any course.
SELECT
	S.STUDENT_NAME,
	S.BRANCH
FROM ENROLLMENT E
INNER JOIN COURSES C
ON E.COURSE_ID = C.course_id
RIGHT JOIN STUDENTS S
ON E.STUDENT_ID = S.STUDENT_ID
WHERE E.STUDENT_ID IS NULL;
;
-- 3. Show course-wise student count.
SELECT
	C.COURSE_NAME,
	COUNT(S.STUDENT_ID) AS COUNT_OF_STUDENT
FROM ENROLLMENT E
INNER JOIN COURSES C
ON E.COURSE_ID = C.course_id
INNER JOIN STUDENTS S
ON E.STUDENT_ID = S.STUDENT_ID
GROUP BY C.COURSE_NAME;
;
-- 4. List students and course names where credits > 3.
SELECT
	*
FROM ENROLLMENT E
INNER JOIN COURSES C
ON E.COURSE_ID = C.course_id
RIGHT JOIN STUDENTS S
ON E.STUDENT_ID = S.STUDENT_ID
WHERE C.CREDITS > 3;
-- 5. Show which students enrolled in more than 1 course.
SELECT
	S.STUDENT_ID,
	S.STUDENT_NAME,
	COUNT(C.COURSE_ID) COUNT_OF_COURSE
FROM ENROLLMENT E
INNER JOIN COURSES C
ON E.COURSE_ID = C.course_id
RIGHT JOIN STUDENTS S
ON E.STUDENT_ID = S.STUDENT_ID
GROUP BY S.STUDENT_ID,S.STUDENT_NAME
HAVING COUNT(C.COURSE_ID)>1;
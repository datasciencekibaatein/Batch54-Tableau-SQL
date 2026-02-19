-- Triggers
-- A trigger in sql is special stored program that automatically executes when a specific event occurs on table.


-- Triggers are commonly used to :
-- Enforce business rules
-- Automatically updates realted to tables
-- Maintain audit logs
-- Validate data before insert/update


-- Triggers events

-- Triggers can be fired for three types of events
-- Insert -> when new row is inserted
-- Update -> When an existing row is modified
-- Delete -> When a row is removed


-- Trigger Timing

-- Before -> Runs before the event happens
-- After -> Runs after the event happens

create database company;
use company;

create table employees(
	emp_id int primary key auto_increment,
    emp_name varchar(40),
    salary decimal(10,2),
    department varchar(30),
    created_at datetime,
    updated_at datetime
);


insert into employees(emp_name,salary,department)
values('alice',50000,'IT'),
('bob',40000,'HR'),
('charlie',60000,'Finance');

select * from employees;

-- SYNTAX
-- CREATE TRIGGER trigger_name
-- BEFORE | AFTER      INSERT | UPDATE | DELETE
-- ON table_name
-- FOR EACH ROW
-- BEGIN
-- 	  --TRIGGER LOGIC
-- END;


-- rules before implementing  triggers

-- Triggers are defined per table
-- only one trigger per timing/event per table
-- FOR EACH ROW is mandatory
-- Triggers can not be manually executed


-- NEW & OLD Keywords
-- NEW.COLUMN -> new value(insert/update)
-- OLD.column -> existing value(update/delete)


-- 1) BEFORE INSERT TRIGGER

DELIMITER //
CREATE TRIGGER BEFORE_EMPLOYEE_INSERT
BEFORE INSERT 
ON EMPLOYEES 
FOR EACH ROW
BEGIN 
	SET NEW.CREATED_AT = NOW();
END//

DELIMITER ;



INSERT INTO EMPLOYEES(EMP_NAME,SALARY,DEPARTMENT)
VALUES('DAVID',45000,'IT');

SELECT * FROM EMPLOYEES;


-- 2) BEFORE UPDATE TRIGGER

DELIMITER $$
CREATE TRIGGER BEFORE_EMPLOYEE_UPDATE
BEFORE UPDATE
ON EMPLOYEES
FOR EACH ROW
BEGIN
	SET NEW.UPDATED_AT = NOW();
END $$
DELIMITER ;


UPDATE EMPLOYEES
SET SALARY = 55000
WHERE EMP_ID = 1;

SELECT * FROM EMPLOYEES;


-- 3) After insert trigger
DELIMITER $$

CREATE TRIGGER AFTER_EMPLOYEE_INSERT
AFTER INSERT 
ON EMPLOYEES
FOR EACH ROW
BEGIN
	IF NEW.SALARY < 30000 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'SALARY CAN NOT BE LESS THAN 30000';
	END IF;
END$$

DELIMITER ;


INSERT INTO EMPLOYEES(EMP_NAME,SALARY,DEPARTMENT)
VALUES('ARIK',30000,'FINANCE');

SELECT * FROM EMPLOYEES;


-- 4) BEFORE DELETE TRIGGER

DELIMITER $$
CREATE TRIGGER BEFORE_EMPLOYEE_DELETE
BEFORE DELETE 
ON EMPLOYEES
FOR EACH ROW
BEGIN
	IF OLD.DEPARTMENT = 'FINANCE' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'FINANCE EMPLOYEE CANNOT BE DELETED';
    END IF;
END $$
DELIMITER ;

DELETE FROM EMPLOYEES
WHERE EMP_ID = 3;


-- 5) AFTER UPDATE

DELIMITER $$
CREATE TRIGGER AFTER_SALARY_UPDATE
AFTER UPDATE
ON EMPLOYEES
FOR EACH ROW
BEGIN
	IF NEW.SALARY < OLD.SALARY THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'SALARY DECREASE NOT ALLOWED';
	END IF;
END $$
DELIMITER ;

SELECT * FROM EMPLOYEES;

UPDATE EMPLOYEES
SET SALARY = 45000
WHERE EMP_ID = 1;


SHOW TRIGGERS;

SHOW TRIGGERS LIKE 'EMPLOYEES';

DROP TRIGGER BEFORE_EMPLOYEE_INSERT;
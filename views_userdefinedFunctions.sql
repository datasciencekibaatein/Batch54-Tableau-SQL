create database views;
use views;

create table employee(
	emp_id int,
    name varchar(20),
    salary int,
    years_exp int
);

insert into employee values
(1,'alice',80000,6),
(2,'bob',50000,3),
(3,'Charlie',65000,4),
(4,'Diana',90000,8);


insert into employee values(5,'Jack',91000,6);

create view temp_table as(
	select
		name,
		salary
	from employee
	where salary > 
	(select 
		avg(salary) 
	from employee)
);


select * from temp_table;

select * from employee;

create view emp_detail as(
	select 
		emp_id,
		name,
		years_exp
	from employee
);

select * from emp_detail;


-- use defined functions
select 
	sum(salary) spending
from employee;



-- Function will return the salary level
select 
	*,
    SALARY_CATEGORY(SALARY) SALARY_CLASSIFICATION
from employee;


DELIMITER $$

CREATE FUNCTION SALARY_CATEGORY(SAL INT)
RETURNS VARCHAR(20)
DETERMINISTIC 
BEGIN 
	DECLARE CATEGORY VARCHAR(20);
    IF SAL>=80000 THEN 
		SET CATEGORY = 'HIGH';
	ELSEIF SAL >=60000 THEN
		SET CATEGORY ='MEDIUM';
	ELSE 
		SET CATEGORY ='LOW';
	END IF;
	
    RETURN CATEGORY;
END$$
DELIMITER ;
    
    


DELIMITER $$

CREATE FUNCTION EXPERIENCE_LEVEL(EXP INT)
RETURNS VARCHAR(20)
DETERMINISTIC 
BEGIN 
	RETURN(
		CASE
			WHEN EXP>=7 THEN 'SENIOR'
            WHEN EXP>=4 THEN 'MID-LEVL'
            ELSE 'JUNIOR'
		END
	);
    END$$
    
DELIMITER $$;

SELECT 
	*,
    EXPERIENCE_LEVEL(YEARS_EXP)
FROM EMPLOYEE;






-- FUNCTION TO BONUS CALCULATION
DELIMITER $$
CREATE FUNCTION CALCULATE_BONUS(
	SAL INT,
    EXP INT
)
RETURNS INT 
DETERMINISTIC
BEGIN 
	IF EXP>=5 THEN
		RETURN SAL * 0.10;
	else
		RETURN SAL * 0.05;
	END IF;
END$$

DELIMITER $$;

DROP FUNCTION CALCUALTE_BONUS;

SELECT
	NAME,
    SALARY,
    CALCULATE_BONUS(SALARY,YEARS_EXP) AS BONUS
FROM EMPLOYEE;


-- USE FUNCTION IN WHERE CLAUSE
SELECT
	*,
    SALARY_CATEGORY(SALARY) SAL_CATEGORY
FROM EMPLOYEE
WHERE SALARY_CATEGORY(SALARY) = 'HIGH';
-- Stored procedure
create database company_db;
use company_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

INSERT INTO employees (first_name, last_name, department, salary, hire_date) VALUES
('Amit','Sharma','IT',60000,'2020-01-15'),
('Neha','Verma','HR',45000,'2019-03-10'),
('Rahul','Singh','Finance',70000,'2018-07-21'),
('Priya','Mehta','IT',80000,'2021-05-12'),
('Karan','Gupta','Marketing',50000,'2017-11-01'),
('Sneha','Kapoor','Finance',75000,'2016-09-23'),
('Rohit','Yadav','IT',62000,'2022-02-18'),
('Anjali','Nair','HR',48000,'2020-06-30'),
('Vikas','Rao','Marketing',52000,'2019-08-14'),
('Pooja','Iyer','IT',90000,'2015-04-19'),
('Arjun','Mishra','Finance',67000,'2018-12-11'),
('Kriti','Das','HR',46000,'2021-01-25'),
('Manish','Tiwari','IT',71000,'2017-03-17'),
('Riya','Sen','Marketing',53000,'2022-07-09'),
('Deepak','Jain','Finance',72000,'2016-10-05'),
('Nikita','Roy','IT',85000,'2019-02-27'),
('Suresh','Pillai','HR',47000,'2018-05-16'),
('Meera','Bansal','Marketing',54000,'2020-09-03'),
('Harsh','Malhotra','IT',78000,'2017-06-22'),
('Divya','Chopra','Finance',73000,'2021-11-29');



-- Stored procedure is a precompiled SQL blocks stored in database that can be executed when needed

-- a) basic stored procedure
delimiter //
create procedure get_all_employees()
begin
	select 
		*
	from employees;
end //
delimiter ;

call get_all_employees;

-- get all employees from IT
delimiter //
create procedure get_it_employees()
begin
	select
		*
	from employees 
    where department = 'IT';
end //
delimiter ;

call get_it_employees;

-- count employees

delimiter //
create procedure count_employee()
begin 
	select count(*) as total_employees from employees;
end //
delimiter ;

call count_employee;

-- b) Stored procedure with parameter
-- Employees by department

delimiter //
create procedure get_by_department(in dept_name varchar(40))
begin
	select 
		*
	from employees
    where department = dept_name;
end //
delimiter ;


call get_by_department('Finance');
call get_by_department('IT');


-- Employees with salary greater than give value
delimiter //
create procedure get_high_salary(in min_salary decimal(10,2))
begin
	select
		*
	from employees
    where salary > min_salary;
end //
delimiter ;


call get_high_salary(80000);

-- manipulate with procedure
-- increase salary by percentage

delimiter //
create procedure increase_salary(in emp int,in percent_increase decimal(5,2))
begin
	update employees
    set salary = salary + (salary*percent_increase/100)
    where emp_id = emp;
end //
delimiter ;

call increase_salary(5,10);

-- c) Stored procedure with control statements

-- if statement
delimiter //
create procedure check_salary(in emp int)
begin 
	declare emp_salary decimal(10,2);
    
    select	
		salary 
	into emp_salary from employees where emp_id = emp;
    
    if emp_salary>75000 then
		select 'high salary' as status;
	else select 'normal salary' as status;
    end if;
end //
delimiter ;

call check_salary(4);

-- procedure with case statements
delimiter //
create procedure salary_grade(in emp int)
begin 
	declare emp_salary decimal(10,2);
    
    select salary into emp_salary from employees where emp_id = emp;
    
    case
		when emp_salary>80000 then select 'grade A';
        when emp_salary>60000 then select 'grade B';
        else select 'grade C';
	end case;
end //
delimiter ;

call salary_grade(5);


-- loop with procedure

delimiter //
create procedure simple_loop()
begin 
	declare counter int default 1;
    
    loop_label:LOOP
		select counter;
        set counter = counter + 1;
        
        if counter > 5 then 
			leave loop_label;
		end if;
	end loop;
end //
delimiter ;

call simple_loop();

-- drop procedures

drop procedure if exists simple_loop;

-- ADV
-- Faster Execution(precompiled)
-- Code reuasability
-- reduce traffic
-- Centralized bussiness logic 


-- difference between user defined functions and stored procedure
-- procudure can modify the data but functions can not
-- control statements can be used with procedure but limited with functions
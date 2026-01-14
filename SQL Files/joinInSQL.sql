use practice;

select * from orders;
select * from products;

insert into products values(11,"LunchBox","Accessories");
insert into orders values(121,12,450,3);


-- inner join
select 
	*
from orders o
inner join products p
on o.productid = p.productid;

select 
	productname,
    sum(saleamount) sale
from orders
inner join products
on orders.productid = products.productid
group by productname;


-- right join
select 
	*
from products p
right join orders o
on o.productid = p.productid;

-- left join
select 
	*
from orders o
left join products p
on o.productid = p.productid;

-- full join
select 
	*
from orders o
left join products p
on o.productid = p.productid

union

select 
	*
from orders o
right join products p
on o.productid = p.productid;

-- cross join
select 
	*
from orders 
cross join products;

-- self join
create table employee (
emp_id int,
emp_name varchar(20),
manager_id int);


insert into employee values
(1,"Rahul",NULL),
(2,"Neha",1),
(3,"Aryan",1),
(4,"Riya",2);


select 
	e.emp_name as emplyee,
	m.emp_name as manager
from employee e
left join employee m
on e.manager_id = m.emp_id;




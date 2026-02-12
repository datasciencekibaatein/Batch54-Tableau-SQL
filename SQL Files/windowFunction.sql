-- windows function
-- types of windows function
-- Aggregation(count,sum,avg,max,min), 
-- Rank(row_number,rank,denserank,cum_dist,percent_rank,ntile(n)) , 
-- value(lead,lag,first_value,last_value)


create database windowfunction;
use windowfunction;
create table orders(
	id int,
    product varchar(10),
    sale int
    );
    
insert into orders values(1,'caps',10),(2,'caps',30),(3,'gloves',20),(4,'gloves',40);

select
	*
from orders;

select 
	product,
	sum(sale) saleAmount
from orders
group by product;


select
	*,
    max(sale) over(partition by product) maxSale,
    max(sale) over (partition by product) - sale givenSale
    
from orders;

-- Window function performs calculation on sepecific subset of data, without leaving the level of detail


drop table orders;


CREATE TABLE orders (
    orderid INT ,
    orderdate DATE,
    customerid INT,
    productid INT,
    saleamount DECIMAL(10,2)
);

INSERT INTO orders (orderid, orderdate, customerid, productid, saleamount) VALUES
(1,'2021-01-05',101,201,1200.50),
(2,'2021-01-12',102,202,850.00),
(3,'2021-01-20',103,203,430.75),
(4,'2021-02-01',104,204,999.99),
(5,'2021-02-10',105,205,1500.00),
(6,'2021-02-18',101,206,620.40),
(7,'2021-03-02',102,207,780.60),
(8,'2021-03-15',103,208,1340.00),
(9,'2021-03-25',104,209,560.00),
(10,'2021-04-05',105,210,2100.90),

(11,'2021-04-18',106,201,980.00),
(12,'2021-05-01',107,202,1150.50),
(13,'2021-05-12',108,203,499.99),
(14,'2021-05-25',109,204,799.00),
(15,'2021-06-05',110,205,1300.75),
(16,'2021-06-20',106,206,680.00),
(17,'2021-07-01',107,207,920.00),
(18,'2021-07-15',108,208,1440.30),
(19,'2021-07-28',109,209,390.00),
(20,'2021-08-10',110,210,1890.00),

(21,'2021-08-25',111,201,2500.00),
(22,'2021-09-05',112,202,750.50),
(23,'2021-09-18',113,203,680.00),
(24,'2021-10-01',114,204,1199.99),
(25,'2021-10-15',115,205,1599.00),
(26,'2021-11-02',111,206,430.00),
(27,'2021-11-18',112,207,870.00),
(28,'2021-12-01',113,208,990.00),
(29,'2021-12-12',114,209,550.50),
(30,'2021-12-28',115,210,2100.00),

(31,'2022-01-10',101,201,1340.00),
(32,'2022-01-22',102,202,780.90),
(33,'2022-02-05',103,203,920.00),
(34,'2022-02-18',104,204,650.75),
(35,'2022-03-02',105,205,1800.00),
(36,'2022-03-15',101,206,590.00),
(37,'2022-03-28',102,207,1020.00),
(38,'2022-04-10',103,208,1600.00),
(39,'2022-04-25',104,209,499.99),
(40,'2022-05-05',105,210,2400.00),

(41,'2022-05-20',106,201,880.00),
(42,'2022-06-01',107,202,1320.00),
(43,'2022-06-15',108,203,720.50),
(44,'2022-06-30',109,204,1400.00),
(45,'2022-07-10',110,205,1650.00),
(46,'2022-07-22',106,206,500.00),
(47,'2022-08-05',107,207,900.00),
(48,'2022-08-18',108,208,1750.00),
(49,'2022-09-01',109,209,600.00),
(50,'2022-09-15',110,210,2200.00),

(51,'2022-10-01',111,201,1550.00),
(52,'2022-10-12',112,202,840.00),
(53,'2022-10-25',113,203,920.00),
(54,'2022-11-05',114,204,1190.00),
(55,'2022-11-20',115,205,1750.00),
(56,'2022-12-02',111,206,480.00),
(57,'2022-12-15',112,207,1025.00),
(58,'2022-12-28',113,208,1500.00),
(59,'2023-01-10',114,209,650.00),
(60,'2023-01-25',115,210,2300.00),

(61,'2023-02-05',101,201,980.00),
(62,'2023-02-18',102,202,720.00),
(63,'2023-03-02',103,203,890.00),
(64,'2023-03-15',104,204,1100.00),
(65,'2023-03-30',105,205,1999.99),
(66,'2023-04-10',101,206,610.00),
(67,'2023-04-25',102,207,950.00),
(68,'2023-05-10',103,208,1450.00),
(69,'2023-05-25',104,209,580.00),
(70,'2023-06-05',105,210,2600.00),

(71,'2023-06-18',106,201,1200.00),
(72,'2023-07-01',107,202,890.00),
(73,'2023-07-15',108,203,760.00),
(74,'2023-07-28',109,204,1350.00),
(75,'2023-08-10',110,205,1700.00),
(76,'2023-08-25',106,206,540.00),
(77,'2023-09-05',107,207,980.00),
(78,'2023-09-18',108,208,1600.00),
(79,'2023-10-01',109,209,620.00),
(80,'2023-10-15',110,210,2450.00),

(81,'2023-11-01',111,201,1500.00),
(82,'2023-11-12',112,202,830.00),
(83,'2023-11-25',113,203,940.00),
(84,'2023-12-05',114,204,1250.00),
(85,'2023-12-20',115,205,1800.00),
(86,'2024-01-05',111,206,500.00),
(87,'2024-01-18',112,207,1050.00),
(88,'2024-02-01',113,208,1700.00),
(89,'2024-02-15',114,209,700.00),
(90,'2024-03-01',115,210,2800.00),

(91,'2024-03-15',101,201,1100.00),
(92,'2024-04-01',102,202,900.00),
(93,'2024-04-18',103,203,850.00),
(94,'2024-05-01',104,204,1300.00),
(95,'2024-05-20',105,205,1950.00),
(96,'2024-06-05',101,206,650.00),
(97,'2024-06-18',102,207,1000.00),
(98,'2024-07-01',103,208,1650.00),
(99,'2024-07-15',104,209,720.00),
(100,'2024-08-01',105,210,3000.00);


INSERT INTO orders (orderid, orderdate, customerid, productid, saleamount) VALUES
(1,'2021-01-05',101,201,1200.50),(1,'2021-01-05',101,201,1200.50),(1,'2021-01-05',101,201,1200.50),
(64,'2023-03-15',104,204,1100.00),(64,'2023-03-15',104,204,1100.00),(88,'2024-02-01',113,208,1700.00);

-- find the total number of orders for each customers, and additionally provide the detail such as order_id,order_date

select
	orderid,
    customerid,
    count(orderid) over(partition by customerid) totalOrders,
    orderdate
from orders;

-- duplicate row
select
	orderid,
    count(*) over(partition by orderid) checkRedundancy
from orders;

drop table orders;

select
	*,
    sum(saleamount) over(partition by productid) totalsum,
    sum(saleamount) over(partition by customerid) totalSumCustomer
from orders;



-- rank function
-- row_number()

-- assign unique number to each ros
-- it does not handle ties

select
	*,
    row_number() over(order by saleamount) row_numberFun
from orders;


-- rank()
-- it handles ties but leaves gap
select
	*,
    rank() over(order by saleamount) rankFunc
from orders;


-- denserank
-- assign rant to each row
-- it handles tie
-- does not leave gap
select
	*,
    dense_rank() over(order by saleamount) rankFunc
from orders;


-- ntile
-- divides the rows into a specified number of approximately equal groups(bucket)

select
	*,
    row_number() over(order by saleamount),
	ntile(5) over(order by saleamount desc) bucket
from orders;


-- percent based ranking
-- cume-dist
select
	*,
    cume_dist() over(order by saleamount) rankFunc
from orders;
-- cum_dist = positionno./number of rows


-- percentrank
select
	*,
    percent_rank() over(order by saleamount) rankFunc
from orders;
-- percentRank = position no. -1 / no. of rows -1


select
	*,
    sum(saleamount) over(partition by productid) sumbyproduct,
    saleamount / sum(saleamount) over(partition by productid) contributionofsaleamount
from orders;

-- value

-- lead , access the value from next row within a window

select
	*,
    lead(saleamount) over(order by month(orderdate)) nextSale,
    lag(saleamount) over(order by month(orderdate)) prevSale,
    first_value(saleamount) over(partition by month(orderdate)) firstValue
from orders;






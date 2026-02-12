use views;
create table orders(
	orderid int,
    orderdate date,
    sale float,
    productname varchar(30),
    category varchar(14)
    );
alter table orders modify category varchar(30);
INSERT INTO orders
VALUES
(1, '2025-01-01', 1200.50, 'iPhone 14', 'Electronics'),
(2, '2025-01-02', 850.00, 'Samsung Galaxy S23', 'Electronics'),
(3, '2025-01-03', 150.75, 'Nike Running Shoes', 'Footwear'),
(4, '2025-01-04', 75.40, 'Levi’s Jeans', 'Clothing'),
(5, '2025-01-05', 45.99, 'Bluetooth Speaker', 'Electronics'),
(6, '2025-01-06', 220.00, 'Office Chair', 'Furniture'),
(7, '2025-01-07', 35.50, 'Wireless Mouse', 'Accessories'),
(8, '2025-01-08', 499.99, 'PlayStation 5 Controller', 'Gaming'),
(9, '2025-01-09', 89.90, 'Coffee Maker', 'Home Appliances'),
(10, '2025-01-10', 1299.00, 'MacBook Air M2', 'Electronics'),
(11, '2025-01-11', 25.00, 'Notebook Pack', 'Stationery'),
(12, '2025-01-12', 199.99, 'Smart Watch', 'Wearables'),
(13, '2025-01-13', 59.95, 'Yoga Mat', 'Fitness'),
(14, '2025-01-14', 320.00, 'Air Fryer', 'Home Appliances'),
(15, '2025-01-15', 18.75, 'Water Bottle', 'Accessories'),
(16, '2025-01-16', 670.40, 'Tablet', 'Electronics'),
(17, '2025-01-17', 95.00, 'Backpack', 'Bags'),
(18, '2025-01-18', 140.00, 'Desk Lamp', 'Furniture'),
(19, '2025-01-19', 560.00, 'Noise Cancelling Headphones', 'Electronics'),
(20, '2025-01-20', 299.99, 'Gaming Keyboard', 'Gaming');

insert into orders values(21,"2025-01-21",95,"headphones","Electronics")


select 
	*
from orders;


-- window functions
-- Perform calculation (aggregation) , without leaving the level detail



select
	*,
    sum(sale) over() totalRevnue,
    sum(sale) over(partition by category) rvnByCtrg
from orders;

-- aggregation(sum,count,avg,min,max)
-- rank function (row_number(),rank(),dense_rank(),cume_dist(),percent_rank(),ntile(n)
-- value function (lead,lag,first_value, last_value)

-- aggregation function
create view AggregationFunction as(
select
	*,
    sum(sale) over() totalRevnue,
    sum(sale) over(partition by category) rvnByCtrg,
    avg(sale) over() avgSaleOfTotal,
    avg(sale) over(partition by category) avgSaleCtrg,
    min(sale) over() minSale,
    min(sale) over(partition by category) minSlByCtrg,
    max(sale) over() maxSale,
    max(sale) over(partition by category) maxSaleByCtrg,
    count(orderid) over() totalRecords,
    count(orderid) over(partition by category) RecordByCtrg
from orders);



select * from aggregationfunction;


-- rank functions

select
	*,
    -- integer rank
    row_number() over(order by sale) saleRank1, -- doesn't handle ties
    rank() over(partition by category order by sale) saleRank2, -- handles tie, but leave gap
    dense_rank() over(order by sale) saleRank3, -- handles ties and dont leave the gap
    ntile(4) over(order by sale) saleRank4, -- create the bucket of the data, n = is no. of buckets
    
    -- percent rank
    cume_dist() over(order by sale)  saleRank5, -- cume_dist = position no / No of rows ( it pick last occurence on ties)
    percent_rank() over(order by sale) saleRank6 -- percent_rank = position no - 1 / no of rows -1  (it pick the first occurence on ties)
from orders;



-- values functions

select
	*,
    lag(sale) over(order by orderdate) as previousSale,
    sale/lag(sale) over(order by orderdate),
    lead(sale) over(order by orderdate) as nextSale,
    first_value (sale) over(partition by category order by orderdate) as firstSale,
    last_value(sale) over(order by orderdate rows between unbounded preceding and unbounded following) last_salary
from orders;



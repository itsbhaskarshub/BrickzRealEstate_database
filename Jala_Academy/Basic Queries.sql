-- 01. Display snum,sname,city and comm of all salespeople.
select snum, sname, city, comm from jala_brickzrealtors.sales_people;

-- 02. Display all snum without duplicates from all orders.
select distinct snum from jala_brickzrealtors.orders;

-- 03. Display names and commissions of all salespeople in london.
select sname,comm from jala_brickzrealtors.sales_people where city = 'London';

 -- 04. All customers with rating of 100.
 select cname from jala_brickzrealtors.customer where rating =100;
 
 -- 05. Produce orderno, amount and date form all rows in the order table.
 select onum, amt, odate from jala_brickzrealtors.orders;
 
 -- 06. All customers in San Jose, who have rating more than 200
 select cname from jala_brickzrealtors.customer where city = 'San Jose' or rating >200;
 
 -- 07. All customers who were either located in San Jose or had a rating above 200.
  select cname from jala_brickzrealtors.customer where city = 'San Jose' and rating >200;

 -- 08 All orders for more than $1000.
 select * from jala_brickzrealtors.orders where amt > 1000;
 
 -- 09 Names and citires of all salespeople in london with commission above 0.10.
 select sname, city from jala_brickzrealtors.sales_people where comm > 0.10 and city = 'London';
 
 -- 10 All customers excluding those with rating < = 100 unless they are located in Rome.
 select cname from jala_brickzrealtors.customer  where rating <= 100 and city = 'Rome';
 
 -- 11 All salespeople either in Barcelona or in london.
 select * from jala_brickzrealtors.sales_people where city in ('Barcelona','London');
 
 -- 12 All salespeople with commission between 0.10 and 0.12. (Boundary values should be excluded)
select sname, comm from jala_brickzrealtors.sales_people where comm > 0.10 and comm < 0.12;
 
 -- 13 All customers with NULL values in city column.
 select cname from jala_brickzrealtors.customer where city is null;
 
 -- 14 All orders taken on Oct 3Rd and Oct 4th 1994.
 select * from jala_brickzrealtors.orders where odate in ('1994-10-03','1994-10-04');
 
 -- 15 All customers serviced by peel or Motika
-- sub - query 
select snum from jala_brickzrealtors.sales_people where sname in ('peel','Motika');
-- main query 
 select cname from jala_brickzrealtors.customer, jala_brickzrealtors.orders 
 where
 jala_brickzrealtors.orders.cnum = jala_brickzrealtors.customer.cnum 
 and 
 jala_brickzrealtors.orders.snum 
 in 
 (
 select snum from jala_brickzrealtors.sales_people 
 where sname in ('peel','Motika')
 );
 
 -- 16 All customers whose names begin with a letter from A to B.
 select * from jala_brickzrealtors.customer where cname like 'A%' or 'B%' or 'a%' or 'b%';
 
 -- 17 All orders except those with 0 or NULL value in amt field.
 select  * from jala_brickzrealtors.orders where amt != 'null' or amt != 0;
 
 -- 18 Count the number of salespeople currently listing orders in the order table
 select count(distinct snum) from jala_brickzrealtors.orders;
 
 -- 19 Largest order taken by each salesperson, datewise.
 select * from jala_brickzrealtors.orders 
 group by odate, snum 
 order by odate,snum;
 
 -- 20 Largest order taken by each salesperson with order value more than $3000.
 select odate, snum, max(amt) from jala_brickzrealtors.orders
 where amt > 3000
 group by odate,snum
 order by odate,snum;
 
 -- 21 Which day had the hightest total amount ordered.
 -- inner qwerty
  select max(amt) from jala_brickzrealtors.orders;
  -- main qwerty
  select  * from jala_brickzrealtors.orders
  where amt = 
  (
  select max(amt) from jala_brickzrealtors.orders
  );
 
 -- 22 count all orders for Oct 3rd.
 select count(*) from jala_brickzrealtors.orders where odate = '1994-10-03';
 
 -- 23 Count the number of different non NULL city values in customers table.
 select count(distinct city) from jala_brickzrealtors.customer;
 
 -- 24 Select each customer’s smallest order.
 select cnum, min(amt) from jala_brickzrealtors.orders 
 group by cnum;
 
 -- 25 First customer in alphabetical order whose name begins with G.
 select cname from jala_brickzrealtors.customer where cname like'G%' limit 1;
 
 -- 26 Get the output like "For dd/mm/yy there are_orders.
 Select 'For', odate, 'there are', count(*), 'orders'  from jala_brickzrealtors.orders group by odate;
 
 -- 27 Assume that each salesperson has a 12% commission. Produce order no., salesperson no., and amount of salesperson’s commission for that order.
select onum, snum, amt, amt * 0.12 from jala_brickzrealtors.orders order by snum;

 -- 28 Find highest rating in each city. Put the output in this form. For the city (city), the highest rating is : (rating).
 select
 'For the city', 
 city, 
 ' the highest rating is: ', 
 max(rating) from jala_brickzrealtors.customer 
 group by city;
 
 -- 29 Display the totals of orders for each day and place the results in descending order.
select * from jala_brickzrealtors.orders 
group by odate
order by count(onum) desc;

 -- 30 All combinations of salespeople and customers who shared a city. (ie same city )
 select sname, cname from 
 jala_brickzrealtors.sales_people as sp,
 jala_brickzrealtors.customer as c
 where sp.city = c.city;
 
 -- 31 Name of all customers matched with the salespeople serving them.
 
 select cname, sname from 
 jala_brickzrealtors.customer as c,
 jala_brickzrealtors.sales_people as sp
 where 
 c.snum = sp.snum;
 
 
 -- 32 List each order number followed by the name of the customer who made the order.
select onum, cname from 
jala_brickzrealtors.orders as o ,
jala_brickzrealtors.customer as c
where o.cnum= c.cnum;

 -- 33 Names of salesperson and customer for each order after the order number.
 select onum, sname, cname from 
 jala_brickzrealtors.customer as c,
 jala_brickzrealtors.sales_people as sp,
 jala_brickzrealtors.orders as o
 where 
 o.cnum = c.cnum
 and
 o.snum = sp.snum;
 
 -- 34 Produce all customer serviced by salespeople with a commission above 12%.
 
 select cname, sname, comm 
 from
 jala_brickzrealtors.customer as c,
 jala_brickzrealtors.sales_people as sp
 where comm > 0.12
 and
 c.snum = sp.snum;
 
 -- 35 Calculate the amount of the salesperson’s commission on each order with a rating above 100.

select sname, amt * comm from
jala_brickzrealtors.orders as o,
jala_brickzrealtors.customer as c,
jala_brickzrealtors.sales_people as s
where rating > 100
and
s.snum = c.snum
and
s.snum = o.snum
and
c.cnum = o.cnum;

 -- 36 Find all pairs of customers having the same rating.

select a.cname, b.cname, a.rating
        from 
        jala_brickzrealtors.customer as a,
        jala_brickzrealtors.customer as b
        where a.rating = b.rating
        and
        a.cnum != b.cnum;
  
 -- 37 Policy is to assign three salesperson to each customers. Display all such combinations.

select a.cname, b.cname, a.rating
        from 
        jala_brickzrealtors.customer as a,
        jala_brickzrealtors.customer as b
        where a.rating = b.rating
        and
        a.cnum != b.cnum
        and 
        a.cnum <> b.cnum;
        
 -- 38 Display all customers located in cities where salesman serres has customer.
-- inner
	select sname from jala_brickzrealtors.sales_people
	where row_count() <>   3 or row_count() = 3;
-- main
select cname, sname 
from 
jala_brickzrealtors.sales_people,
jala_brickzrealtors.customer 
where sname in (
		select sname from jala_brickzrealtors.sales_people
		where row_count() <>   3 or row_count() = 3
)
order by cname;

-- 39 Find all pairs of customers served by single salesperson.
-- inner 
select snum 
from jala_brickzrealtors.sales_people 
where sname = 'Serres'; 
-- outer inner 
select city 
from jala_brickzrealtors.customer as c,
	 jala_brickzrealtors.orders as o
      where 
      c.cnum = o.cnum
      and 
      o.snum in (
					select snum 
					from jala_brickzrealtors.sales_people 
					where sname = 'Serres'
				);

-- main
select cname 
from jala_brickzrealtors.customer as c 
where city in (
				select city 
						from jala_brickzrealtors.customer as c,
						jala_brickzrealtors.orders as o
						where 
						c.cnum = o.cnum
						and 
						o.snum in (
									select snum 
									from jala_brickzrealtors.sales_people as s
									where sname = 'Serres'
								)
				);

 -- 40 Produce all pairs of salespeople which are living in the same city. Exclude combinations of salespeople with themselves as well as duplicates with the order reversed.
 
 select * from jala_brickzrealtors.customer
 where snum in (
				select snum 
                from jala_brickzrealtors.customer
                group by snum
                having count(snum) > 1
                );

 
 -- 41 Produce names and cities of all customers with the same rating as Hoffman.
-- inner
select rating from jala_brickzrealtors.customer where cname ='Hoffman';

-- main
select cname, city, rating from jala_brickzrealtors.customer
where rating  = ( 
				select rating 
                from jala_brickzrealtors.customer 
                where cname ='Hoffman'
                );

 -- 42 Extract all the orders of Motika.
 -- inner
 select snum from jala_brickzrealtors.sales_people where sname = 'Motika';
 -- main
 select onum from jala_brickzrealtors.orders 
 where snum = (
				select snum 
                from jala_brickzrealtors.sales_people 
                where sname = 'Motika'
                );

 
 -- 43 All orders credited to the same salesperson who services Hoffman.
-- inner
select cnum from jala_brickzrealtors.customer where cname = 'Hoffman';

-- outer inner
select snum 
from jala_brickzrealtors.orders 
where cnum = (
				select cnum 
                from jala_brickzrealtors.customer 
                where cname = 'Hoffman'
				);
-- main

select onum, sname, cname, amt 
from jala_brickzrealtors.orders as o,
	 jala_brickzrealtors.sales_people as s,
     jala_brickzrealtors.customer as c
     where
     o.snum = s.snum
     and 
     o.cnum = c.cnum
     and 
     o.snum = (
				select snum 
				from jala_brickzrealtors.orders 
				where cnum = (
								select cnum 
								from jala_brickzrealtors.customer 
								where cname = 'Hoffman'
							  )
                );

 -- 44 All orders that are greater than the average for Oct 4.
 -- inner 
 select avg(amt) from jala_brickzrealtors.orders 
 where odate = '1994-10-04';
 
 -- main
 select amt from jala_brickzrealtors.orders
 where amt > (
				select avg(amt) from jala_brickzrealtors.orders 
				where odate = '1994-10-04');
 
 
 -- 45 Find average commission of salespeople in london.
select avg(comm) from jala_brickzrealtors.sales_people 
where city = 'London';

 -- 46 Find all orders attributed to salespeople servicing customers in london.
-- inner
select cnum from jala_brickzrealtors.customer 
where city = 'London' ;
-- main
select snum, cnum from jala_brickzrealtors.orders
where cnum in 
	(
    select cnum from jala_brickzrealtors.customer 
    where city = 'London'
    );

 -- 47 Extract commissions of all salespeople servicing customers in London.
-- inner
select snum from jala_brickzrealtors.customer
where city = 'London';
-- main
select comm from jala_brickzrealtors.sales_people 
where snum in 
(
	select snum from jala_brickzrealtors.customer 
    where city = 'London'
);

 -- 48 Find all customers whose cnum is 1000 above the snum of serres.
 -- inner 
 select snum + 1000 from jala_brickzrealtors.sales_people where sname = 'serres'; 
 
 -- main
 select * from jala_brickzrealtors.customer 
 where cnum > (
  select snum + 1000 from jala_brickzrealtors.sales_people 
  where sname = 'serres'
 );
 
 -- 49 Count the customers with rating above San Jose’s average.
  -- inner qwerty
 select rating from jala_brickzrealtors.customer where city = 'San Jose';
  -- main qwerty
  
  select cnum, rating  from jala_brickzrealtors.customer 
  where rating  > (
    select rating from jala_brickzrealtors.customer
    where city = 'San Jose'
    );

 
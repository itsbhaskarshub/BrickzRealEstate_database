-- Table for Sales_People

create table sales_people(
snum int(5) primary key,
sname char(10),
city char(20),
comm decimal(8,3)
);

-- Insert Value in Sales_People table

Insert into sales_people values (1001, 'Peel', 'London', 0.12);
Insert into sales_people values (1002, 'Serres', 'San Jose', 0.13);
Insert into sales_people values (1004, 'Motika', 'London', 0.11);
Insert into sales_people values (1007, 'Rafkin', 'Barcelona', 0.15);
Insert into sales_people values (1003, 'Axelrod', 'New York', 0.10);

 -- Creating New Table for Customers
 
 create table customer(
 cnum int(5) primary key,
 cname char(10),
 city char(20),
 rating int(3),
 snum int(4)
 );
 
 -- insert value in customer table
 
insert into customer values (2001, 'Hoffman' , 'London' , 100, 1001);
insert into customer values (2002, 'Giovanne' , 'Rome' , 200, 1003);
insert into customer values (2003, 'Liu' , 'San Jose' , 300, 1002);
insert into customer values (2004, 'Grass' , 'Brelin' , 100, 1002);
insert into customer values (2006, 'Clemens' , 'London' , 300, 1007);
insert into customer values (2007, 'Pereia' , 'Rome' , 100, 1004);

 -- Create a number table for orders
 
 CREATE TABLE orders(
 onum int(5) PRIMARY KEY,  
 amt decimal(8,2), 
 odate Date, 
 cnum int(4),
 snum int(4)
 );
 
  -- insert value in orders table
  
insert into orders values (3001, 18.69 , "1994-10-03", 2008, 1007);
insert into orders values (3003, 767.19 , "1994-10-03", 2001, 1001);
insert into orders values (3002, 1900.10 , "1994-10-03", 2007, 1004);
insert into orders values (3005, 5160.45 , "1994-10-03", 2003, 1002);
insert into orders values (3006, 1098.16 , "1994-10-04", 2008, 1007);
insert into orders values (3009, 1713.23 , "1994-10-04", 2002, 1003);
insert into orders values (3007, 75.50 , "1994-10-05", 2006, 1002);
insert into orders values (3008, 4723.00 , "1994-10-05", 2006, 1001);
insert into orders values (3010, 1309.95 , "1994-10-06", 2004, 1002);
insert into orders values (3011, 9891.88 , "1994-10-06", 2006, 1001);


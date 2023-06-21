CREATE DATABASE OnlineShoppingSystem_DB

CREATE TABLE Categories(
category_ID INT primary key,
category_name varchar(30),
category_type varchar(30)
)

create table Products(
product_ID int primary key,
category_ID int,
foreign key (category_ID) references Categories(category_ID)
)

create table Seller(
seller_ID int primary key,
product_ID int,
foreign key (product_ID) references Products(product_ID)
)

create table Customers(
customer_ID int primary key,
name varchar(30),
contact_add varchar(30),
address varchar(30)
)

create table Payment(
payment_ID int primary key,
category_ID int,
foreign key(category_ID) references Categories(category_ID)
)

create table ShoppingOrder(
order_ID int primary key,
customer_ID int,
foreign key (customer_ID) references Customers(customer_ID)
)

create table Deliveries(
deliveries_ID int primary key,
customer_ID int,
foreign key (customer_ID) references Customers(customer_ID),
Deliveries_Date dateTime
)

create table TransactionReports(
report_ID int primary key,
customer_ID int,
foreign key (customer_ID) references Customers(customer_ID),
order_ID int,
foreign key (order_ID) references ShoppingOrder(order_ID),
product_ID int,
foreign key (product_ID) references Products(product_ID),
payment_ID int,
foreign key (payment_ID) references Payment(payment_ID),
)

select * from Categories
select * from Products
select * from Seller
select * from Customers
select * from Payment
select * from ShoppingOrder
select * from Deliveries
select * from TransactionReports

insert into Categories(category_ID,category_name,category_type) values 
(1001,'electronics','mobile & tablets'),
(1002,'electronics','tv'),
(1003,'electronics','washing machine'),
(1004,'electronics','kitchen appliances'),
(1005,'electronics','AC'),
(1006,'electronics','laptop'),
(1007,'faction','man'),
(1008,'faction','weman'),
(1009,'grocery','snacks and bevrages'),
(10010,'grocery','Packaged food')

alter table Products add product_name varchar(30)

insert into Products(product_ID,category_ID,product_name) values 
(100101,1001,'I Phone 15'),
(100202,1002,'Samsumg galaxy'),
(100303,1003,'Warpool v1'),
(100404,1004,'jucers'),
(100505,1001,'one plus 9RT 5g'),

(100606,1006,'Asus F15 i5 13th gen'),
(100707,1007,'T-shirts'),
(100808,1008,'sarees'),
(100909,1009,'Biscuits'),
(1001010,10010,'Noodls and pasta')

alter table Seller add name varchar(30)
insert into Seller(seller_ID,product_ID,name) values
(101,100101,'Raj store'),
(102,100202,'Galaxy store'),
(103,100303,'vijay sells'),
(104,100404,'grocery store'),
(105,100505,'chroma mobile store'),

(106,100606,'chroma laptop store'),
(107,100707,'peter england store'),
(108,100808,'peter england store'),
(109,100909, 'sanjay kirana store'),
(1010,1001010,'sunile kirana store')

insert into Customers(customer_ID,name,contact_add,address) values
(1,'rushi k','temprary', 'bhandup'),
(2,'Raj s','premanent','pune'),
(3,'aftab p','permanent','mulund'),
(4,'ronit k','temprary', 'bhandup'),
(5,'Arti s','premanent','pune'),

(6,'shubham p','permanent','mulund'),
(7,'Datta k','temprary', 'bhandup'),
(8,'rajveer s','premanent','pune'),
(9,'shiv p','permanent','mulund'),
(10,'sankoch k','temprary', 'bhandup')

alter table Payment add PaymentDateTime datetime
insert into Payment(payment_ID,category_ID, PaymentDateTime) values
(1000001,1001,'2012-12-05 10:34:09'),
(1000002,1002,'03-06-2015 10:34:09 '),
(1000003,1003,'05-08-2020 10:34:09'),
(1000004,1004,'09-12-22 10:34:09'),
(1000005,1005,'18-04-23 10:34:09 AM'),

(1000006,1006,'12-02-19 10:34:09 AM'),
(1000007,1007,'11-09-18 10:34:09 AM'),
(1000008,1008,'14-01-14 10:34:09 AM'),
(1000009,1009,'19-05-18 10:34:09 AM'),
(10000010,10010,'25-04-13 10:34:09 AM')

insert into ShoppingOrder(customer_ID,order_ID) values
(1,10000001),
(1,10000002),
(1,10000003),
(1,10000004),
(1,10000005),

(2,10000006),
(2,10000007),
(3,10000008),
(4,10000009),
(4,100000010)

insert into Deliveries(deliveries_ID,customer_ID,Deliveries_Date) values
(10000001,1,(convert(datetime,'17-02-12 10:34:09 AM',5))

insert into TransactionReports(report_ID,customer_ID,order_ID,product_ID,payment_ID) values
()
create table Employee
(
EmployeeID int primary key,
EmployeeName varchar(30),
Dempartment varchar(20),
salary int,
)

create table Emp
(
EmployeeID int primary key,
EmployeeName varchar(30),
salary int,
)

create table Department
(
DepartmentId int primary Key,
Department varchar(20),
EmployeeID int,
foreign key (EmployeeID) from Emp(EmployeeID)  
)

--Design a normalized database schema to store student details such as name, student ID, address, 
--contact information, and courses enrolled. Ensure that there is no data redundancy and all the tables 
--are properly related.

create schema student;

create table student.detaile 
(
studentID int primary key,
firstName varchar(30), 
lastName varchar(30), 
address varchar(50)
)

create table student.contact
(
ContactID int primary key,
contactNumber int,
studentID int,
foreign key studentID from student.detaile(studentID)
)

create table student.courses
(
CoursesID int primary key,
courses varchar(30),
studentID int,
foreign key studentID from student.detaile(studentID)
)

--A company wants to track their sales and customer information. Design a normalized database schema that stores 
--information about customers, orders, and products. Ensure that the schema eliminates data redundancy and allows 
--efficient querying of sales data.

create schema sales ;
create schema customer 

create table customer.details
(
customerID int primary key,
customerFirstName varchar(30),
customerLastName varchar(30),
Address varchar(50),
)

create table sales.orders
(
orderID int primary key,
productID int,
foreign key(productID) references sales.product(productID),
customerID int,        
foreign key (customerID) references customer.details(customerID)
)

create table sales.product
(
productID int primary key,
productName varchar(30),
)

-- A library wants to manage its book inventory, including information about books, authors,
-- and borrowing history. Design a normalized database schema that ensures data integrity and 
-- efficient management of library resources.

create schema book
create schema consumer

create table book.detailes
(
bookID int primary key,
bookName varchar(30),
author varchar(30),
)

create table consumer.details
(
consumerID int primary key,
consumerName varchar(30),
address varchar(50),
)

create table book.Orderhistory
(
orderID int primary key,
bookID int,
foreign key (bookID) references book.detailes(bookID),
consumerID int,
foreign key (consumerID) references consumer.details(consumerID)
)

-- An online shopping website wants to store information about products, customers, and orders.
-- Design a normalized database schema that eliminates data duplication and allows for efficient retrieval 
-- of customer and order information.

create table product
(
productID int primary key,
productName varchar(30),
)

create table customers
(
customerID int primary key,
customerName varchar(30),
)

create table addressDetails
(
addressID int primary key,
customerAddress varchar(50),
customerID int,
foreign key(customerID) references customers(customerID)
)

create table contactDetails
(
phoneID int primary key,
phoneNumber int,
customerID int,
foreign key(customerID) references customers(customerID)
)

create table orders
(
orderID int primary key,
productID int,
foreign key (productID) references from product(productID),
)

-- A hospital wants to maintain patient records, including details about patients, 
-- doctors, medical visits, and prescriptions. Design a normalized database schema 
-- that ensures data consistency, eliminates data redundancy, and allows for efficient
-- retrieval of patient-related information.

create schema patient
create schema doctors
create schema prescriptions

create table patient.detail
(
patientID int primary key,
patientFirstName varchar(20),
patientLastName varchar(20),
PatientAge tinyint,
)

create table patient.gardenDetaile
(
gardienID int primary key,
gardienName varchar(30),
gardienPhoneNumber int,
relationToPatient varchar(30),
)

create table doctors.details
(
doctorID int primary key,
doctorFiestName varchar(20),
doctorLastName varchar(20)
)

create table doctors.medicalVisit
(
medicalVisitID int primary key,
doctorID int,
foreign key (doctorID) references doctors.details(doctorID)
)

create table prescriptions.details
(
prescripctionID int primary key,
prescriptionsInfo varchar(30),
doctorID int,
foreign key (doctorID) references doctors.details(doctorID)
)

----------------------------------------------------------==============
-- Write a query to find all employees and their immediate supervisors in a company hierarchy using a recursive CTE.

with cte_emp_superviser(employeeID ,supervisrID ) as
(
select employeeID,supervisrID form employee where superviserID is not null
union all
select e.employeeID,e.supervisrID from Employee e
join cte_emp_superviser on e.supervisor_id = cte.employee_id
)

select * from cte_emp_superviser;
create table Employees(
EmployeeID int primary key,
Name varchar(30) not null,
Age tinyint not null,
Department varchar(20)
)

select * from Employees
alter table Employees add Salary int

insert into Employees(EmployeeID,Name,Age,Department,Salary) values
(1,'Rushi',27,'HR',40000),
(2,'Shubham',25,'Chem',50000),
(3,'Raj',24,'intern',15000),
(4,'Shiva',23,'intern',10000)

update Employees set Salary = 55000 where EmployeeID = 1

delete Employees where Age <=25

alter table Employees drop column FullName
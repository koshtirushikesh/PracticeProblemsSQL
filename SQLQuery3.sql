select * from production.products 
order by list_price,
    product_name 
offset 10 rows
fetch next 10 rows only

SELECT top 1 percent with ties
    product_name,
    list_price
FROM
    production.products
ORDER BY
    list_price,
    product_name 
OFFSET 10 ROWS 
FETCH NEXT 10 ROWS ONLY;

select top 10 * from production.products 
where product_id =10 or model_year=2018 
order by product_id 

SELECT
    customer_id,
    first_name,
    last_name,
    phone
FROM
    sales.customers
WHERE
    phone = NULL
ORDER BY
    first_name,
    last_name;


	select * from production.brands inner join production.categories on production.brands.brand_id =  production.categories.category_id
	where production.brands.brand_id <=10


	
	
	
	select * from Employees 

	alter table Employees add FullName varchar(30)
	
	select * from Emp
	create table Emp(
	name varchar(30),
	age tinyInt
	)
	drop table Emp

	insert into Employees(EmployeeID,Name,Age,Department,Salary,FullName) values
	(2,'Shubham',28,'Sales',50000,'Shubham Kamble')

	update Employees set Salary = 20000 where EmployeeID=1

	delete from Employees where EmployeeID =2

	truncate table Employees

	
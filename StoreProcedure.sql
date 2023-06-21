

CREATE FUNCTION sales.udfNetSale(
    @quantity INT,
    @list_price DEC(10,2),
    @discount DEC(4,2)
)
RETURNS DEC(10,2)
AS 
BEGIN
    RETURN @quantity * @list_price * (1 - @discount);
END;

SELECT sales.udfNetSale(10,100,0.1) net_sale;


create function dbo.udfSum(
	@Fnum int,
	@snum int
)
returns int as
begin 
	return @fnum + @snum;
end 

select dbo.udfSum(10,20) sum ;

create procedure uspatestData
as
begin 
	select * from emp;
end 

execute uspatestData

create procedure uspReadData
(
@empID int
)
as begin 
	select * from Employees where EmployeeID = @empID; 
end 
select * from Employees
execute uspReadData 1;

alter procedure uspInsertData
(
@empID int,
@empName varchar(20),
@empAge tinyint,
@empDepartment varchar(20),
@empSalary int
)
as begin
	insert into Employees
	(EmployeeID,Name,Age,Department,Salary)  values
	(@empID,@empName ,@empAge ,@empDepartment ,@empSalary )

end

execute uspInsertData 1,'rushi',39,'it',39999;
execute uspInsertData 2,'sham',50,'hr',60000;
execute uspInsertData 3,'Aftab',25,'sales',20000;

create procedure uspUpdateSalaryData
( @empID int,@empSalary int )
as begin 
	update Employees 
	set Salary=@empSalary
	where EmployeeID=@empID;
end
select * from Employees
execute uspUpdateSalaryData 2 ,75000;

create procedure uspDeleteData
( @empID int )
as begin
	delete from Employees where EmployeeID =@empID;
end

execute uspDeleteData 2;
======================================================================================
--Problem: Create a stored procedure that retrieves all records from a 'Sales' table where the sale date is 
--between the provided start and end dates.
	alter procedure uspCustomeSalesRecords
	(
	@startDate date,
	@endDate date
	)
	as begin 
		select * from sales.recordes where salesDate between @startDate and @endDate;
	end

select * from sales.recordes
create table sales.recordes
(
salesID int,
salesDate date)

insert into sales.recordes(salesID,salesDate) values (1,'20231201')
insert into sales.recordes(salesID,salesDate) values (2,'20230101')
insert into sales.recordes(salesID,salesDate) values (3,'20230201')
insert into sales.recordes(salesID,salesDate) values (4,'20230301')
insert into sales.recordes(salesID,salesDate) values (5,'20230401')
insert into sales.recordes(salesID,salesDate) values (1,'20231201')

execute uspCustomeSalesRecords '20230101' ,'20230301',
	--select * from sales.recordes where salesDate between '20230101' and '20230401'  ;

--Problem: Create a stored procedure that updates a 'Products' table with the provided product 
--name and price for the record that matches the provided product ID.

create procedure (
	@ProID int,
	@ProName varchar(20),
	@ProPrice int
)
as begin 
	update sales.product set productName =@ProName , productPrise=@ProPrice where ProID = @ProID
	end
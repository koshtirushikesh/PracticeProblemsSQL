ALTER PROCEDURE uspFindProducts(@min_list_price AS DECIMAL)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    WHERE
        list_price >= @min_list_price
    ORDER BY
        list_price;
END;


EXEC uspFindProducts 100;


ALTER PROCEDURE uspFindProducts(
    @min_list_price AS DECIMAL
    ,@max_list_price AS DECIMAL
)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    WHERE
        list_price >= @min_list_price AND
        list_price <= @max_list_price
    ORDER BY
        list_price;
END;

EXECUTE uspFindProducts 900, 1000;

ALTER PROCEDURE uspFindProducts(
    @min_list_price AS DECIMAL
    ,@max_list_price AS DECIMAL
    ,@name AS VARCHAR(max)
)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    WHERE
        list_price >= @min_list_price AND
        list_price <= @max_list_price AND
        product_name LIKE '%' + @name + '%'
    ORDER BY
        list_price;
END;
 
 EXECUTE uspFindProducts 
    @min_list_price = 900, 
    @max_list_price = 1000,
    @name = 'Trek';


	ALTER PROCEDURE uspFindProducts(
    @min_list_price AS DECIMAL = 0
    ,@max_list_price AS DECIMAL = NULL
    ,@name AS VARCHAR(max)
)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    WHERE
        list_price >= @min_list_price AND
        (@max_list_price IS NULL OR list_price <= @max_list_price) AND
        product_name LIKE '%' + @name + '%'
    ORDER BY
        list_price;
END;

EXECUTE uspFindProducts 
    @min_list_price = 500,
    @name = 'Haro';


	CREATE PROCEDURE uspFindProductByModel (
    @model_year SMALLINT,
    @product_count INT OUTPUT
) AS
BEGIN
    SELECT 
        product_name,
        list_price
    FROM
        production.products
    WHERE
        model_year = @model_year;

    SELECT @product_count = @@ROWCOUNT;
END;

DECLARE @count INT;

EXEC uspFindProductByModel
    @model_year = 2018,
    @product_count = @count OUTPUT;

SELECT @count AS 'Number of products found';



BEGIN
    DECLARE @name VARCHAR(MAX);

    SELECT TOP 1
        @name = product_name
    FROM
        production.products
    ORDER BY
        list_price DESC;
    
    IF @@ROWCOUNT <> 0
    BEGIN
        PRINT 'The most expensive product is ' + @name
    END
    ELSE
    BEGIN
        PRINT 'No product found';
    END;
END

BEGIN
    DECLARE @sales INT;

    SELECT 
        @sales = SUM(list_price * quantity)
    FROM
        sales.order_items i
        INNER JOIN sales.orders o ON o.order_id = i.order_id
    WHERE
        YEAR(order_date) = 2018;

    SELECT @sales;

    IF @sales > 1000000
    BEGIN
        PRINT 'Great! The sales amount in 2018 is greater than 1,000,000';
    END
END


BEGIN
    DECLARE @sales INT;

    SELECT 
        @sales = SUM(list_price * quantity)
    FROM
        sales.order_items i
        INNER JOIN sales.orders o ON o.order_id = i.order_id
    WHERE
        YEAR(order_date) = 2017;

    SELECT @sales;

    IF @sales > 10000000
        PRINT 'Great! The sales amount in 2018 is greater than 10,000,000';
		
    ELSE
        PRINT 'Sales amount in 2017 did not reach 10,000,000';
		PRINT 'Sales amount in 2017 did not reach 10,000,000';
END


BEGIN
    DECLARE @x INT = 30,
            @y INT = 20;

    IF (@x > 0)
    BEGIN
        IF (@x < @y)
            PRINT 'x > 0 and x < y';
        ELSE
            PRINT 'x > 0 and x >= y';
    END			
END

DECLARE @counter INT = 1;

WHILE @counter <= 5
BEGIN
    PRINT @counter;
    set @counter = @counter + 1;
END


declare @countInt int =1;
while @countInt <=10
begin 
	
	set @countInt= @countInt + 1;
	
	if @countInt = 5
		continue;
	if @countInt > 7
		break;
	print @countInt ; 
end

CREATE PROC usp_divide(
    @a decimal,
    @b decimal,
    @c decimal output
) AS
BEGIN
    BEGIN TRY
        SET @c = @a / @b;
    END TRY
    BEGIN CATCH
        SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH
END;
GO

declare @r4 decimal;
execute usp_divide 10,0 ,@r4 output;
print @r4;

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

select sales.udfNetSale(10 , 12.34 , 0.34) 'net sales'; 


SELECT 
    order_id, 
    SUM(sales.udfNetSale(quantity, list_price, discount)) net_amount
FROM 
    sales.order_items
GROUP BY 
    product_id
ORDER BY
    net_amount DESC;

SELECT * from sales.order_items


CREATE FUNCTION udfProductInYear (
    @model_year INT
)
RETURNS TABLE
AS
RETURN
    SELECT 
        product_name,
        model_year,
        list_price
    FROM
        production.products
    WHERE
        model_year = @model_year;


SELECT * FROM udfProductInYear(2017);


ALTER FUNCTION udfProductInYear (
    @start_year INT,
    @end_year INT
)
RETURNS TABLE
AS
RETURN
    SELECT 
        product_name,
        model_year,
        list_price
    FROM
        production.products
    WHERE
        model_year BETWEEN @start_year AND @end_year

		SELECT 
    product_name,
    model_year,
    list_price
FROM 
    udfProductInYear(2017,2018)
ORDER BY
    product_name;


CREATE FUNCTION udfContacts()
    RETURNS @contacts TABLE (
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        email VARCHAR(255),
        phone VARCHAR(25),
        contact_type VARCHAR(20)
    )
AS
BEGIN
    INSERT INTO @contacts
    SELECT 
        first_name, 
        last_name, 
        email, 
        phone,
        'Staff'
    FROM
        sales.staffs;

    INSERT INTO @contacts
    SELECT 
        first_name, 
        last_name, 
        email, 
        phone,
        'Customer'
    FROM
        sales.customers;
    RETURN;
END;

SELECT 
    count(first_name) 
FROM
    udfContacts();

create function dbo.udf_count_contact(@contact int)
RETURNS int
as begin 
	return (select count(*) from contact);
end;

select udf_count_contact(10) count_;

-- Create a function that takes two integer inputs and returns the maximum of the two.
-- If both inputs are equal, return a message saying that the inputs are equal.

create function udfMaxmumNum(@fNum int,@sNum int)
returns int
as begin 
	if @fNum < @sNum
	begin
		return @sNum;
	end

	return @fNum;
end
	
select dbo.udfMaxmumNum(10,20) 'Maximum Num';

	================================================
--Create a function that takes a product ID as input and returns the product name. 
--If the product ID does not exist in the 'Products' table, return a message saying that the product does not exist.

alter function udfProductNameAsPerProductID(@productID int)
returns varchar(max)
as begin
	if exists (select productName from sales.product where productID = @productID)
		begin 
		 return (select productName from sales.product where productID = @productID)	
		end

	return 'value not found';
end

select dbo.udfProductNameAsPerProductID(1) productName;
select * from sales.product 
insert into sales.product(productID,productName) values (1,'Rushi');

-- Create a function that takes a date as input and returns the total revenue generated on that date. 
-- If there are no sales on the provided date, return a message saying that there are no sales for the given date.

alter function udfTotalRevenue(@Revinuedate date)
returns varchar(max) 
as begin 
		if exists (select Revinue from product where Revinuedate = @Revinuedate)
			begin
				return (select sum(Revinue) from product where Revinuedate = @Revinuedate);
			end
		
		return 'no sales for given date';
end

select dbo.udfTotalRevenue('20230801') _revanue;

create table product
(
Revinuedate date,
Revinue   int
)
select * from product
insert into product(Revinuedate,Revinue) values
('20230701',123),
('20230801',123),
('20230701',123),
('20230701',123),
('20230701',123)

--Create a function that takes a customer ID as input and returns the name of the customer.
--If the customer ID does not exist in the 'Customers' table, return a message saying that the customer does not exist.

create table Customers
(
customerID int,
customerName varchar(30)
)
insert into Customers(customerID,customerName) values (1,'rushi'),(2,'ram')

create function customerNameForId(@customerID int)
returns varchar(max)
as begin 
	if exists (select customerName from Customers where customerID = @customerID)
		return (select customerName from Customers where customerID = @customerID);
	return 'customer does not exist';
end
	
select dbo.customerNameForId(1) _customerName;

--Create a function that takes a city name as input and returns the total number of customers in that city. 
--If there are no customers in the provided city, return a message saying that there are no customers in the given city.
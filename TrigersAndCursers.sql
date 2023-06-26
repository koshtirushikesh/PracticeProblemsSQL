

create schema production

		create TABLE production.product_audits(
			change_id INT IDENTITY PRIMARY KEY,
			product_id INT NOT NULL,
			product_name VARCHAR(255) NOT NULL,
			brand_id INT NOT NULL,
			category_id INT NOT NULL,
			model_year SMALLINT NOT NULL,
			list_price DEC(10,2) NOT NULL,
			updated_at DATETIME NOT NULL,
			operation CHAR(3) NOT NULL,
			CHECK(operation = 'INS' or operation='DEL')
		);



CREATE TRIGGER production.trg_product_audit
ON production.products
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO production.product_audits(product_id, product_name,brand_id,category_id,model_year,list_price, updated_at, operation)
    SELECT i.product_id,product_name,brand_id,category_id,model_year,i.list_price, GETDATE(),'INS'
    FROM inserted i

    UNION ALL
    SELECT d.product_id,product_name,brand_id,category_id,model_year,d.list_price,GETDATE(),'DEL'
    FROM deleted d;
END

INSERT INTO production.products(
    product_name, 
    brand_id, 
    category_id, 
    model_year, 
    list_price
)
VALUES (
    'Test product',
    1,
    1,
    2018,
    599
);

	SELECT 
    * 
FROM 
    production.product_audits;

	select * from production.products 

DELETE FROM 
    production.products
WHERE 
    product_id = 323;
	-------------------------------------------
	CREATE TABLE index_logs (
    log_id INT IDENTITY PRIMARY KEY,
    event_data XML NOT NULL,
    changed_by SYSNAME NOT NULL
);
GO

drop table index_logs

	CREATE TRIGGER trg_index_changes
ON DATABASE
FOR	
    CREATE_INDEX,
    ALTER_INDEX, 
    DROP_INDEX
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO index_logs (
        event_data,
        changed_by
    )
    VALUES (
        EVENTDATA(),
        USER
    );
END;
GO



create table customers(first_name varchar(30) , last_name varchar(30))

CREATE NONCLUSTERED INDEX nidx_fname	
ON customers(first_name);
GO

drop INDEX customers.nidx_lname
ON customers(last_name);
GO

select * from index_logs	

-----------------------------------		

DECLARE 
    @product_name VARCHAR(MAX), 
    @list_price   DECIMAL;

DECLARE cursor_product CURSOR
FOR SELECT 
        product_name, 
        list_price
    FROM 
        production.products;

OPEN cursor_product;

FETCH NEXT FROM cursor_product INTO 
    @product_name, 
    @list_price;

WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @product_name + CAST(@list_price AS varchar);
        FETCH NEXT FROM cursor_product INTO 
            @product_name, 
            @list_price;
    END;

CLOSE cursor_product;

DEALLOCATE cursor_product;

SELECT TOP 10
    product_name, 
    list_price
FROM
    production.products
ORDER BY 
    list_price DESC;

	-------------------
	SELECT TOP 1 PERCENT
    product_name, 
    list_price
FROM
    production.products
ORDER BY 
    list_price DESC;
	-----------------------
	SELECT TOP 3 WITH TIES
    product_name, 
    list_price
FROM
    production.products
ORDER BY 
    list_price DESC;
	---------------------
	SELECT DISTINCT
    city
FROM
    sales.customers
ORDER BY
    city;
	--------------------

	SELECT DISTINCT
    city,
    state
FROM
    sales.customers
ORDER BY 
    city, 
    state;
	--------------------
	SELECT DISTINCT
    phone
FROM
    sales.customers
ORDER BY
    phone;
	-------------------
	SELECT 
	city, 
	state, 
	zip_code
FROM 
	sales.customers
GROUP BY 
	city, state, zip_code
ORDER BY
	city, state, zip_code
	---------------------
	SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    category_id = 1 AND model_year = 2018
ORDER BY
    list_price DESC;

	SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    list_price > 300 AND model_year = 2018
ORDER BY
    list_price DESC;

	SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    list_price > 3000 OR model_year = 2018
ORDER BY
    list_price DESC;



	SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    product_name LIKE '%Cruiser%'
ORDER BY
    list_price;
	--------------------
	SELECT
    product_name,
    list_price
FROM
    production.products
WHERE
    list_price < 200
OR list_price > 6000
ORDER BY
    list_price;

	SELECT
    product_name,
    brand_id
FROM
    production.products
WHERE
    brand_id = 1
OR brand_id = 2
OR brand_id = 4
ORDER BY
    brand_id DESC;
	-------------------------

	SELECT
    product_name,
    brand_id
FROM
    production.products
WHERE
    brand_id IN (1, 2, 3)
ORDER BY
    brand_id DESC;
	------------------------
	SELECT
    product_name,
    brand_id,
    list_price
FROM
    production.products
WHERE
    (brand_id = 1 OR brand_id = 2)
     AND list_price > 500
ORDER BY
    brand_id;
	-----------------------

	SELECT
    order_id,
    customer_id,
    order_date,
    order_status
FROM
    sales.orders
WHERE
    order_date BETWEEN '20170115' AND '20170117'
ORDER BY
    order_date;













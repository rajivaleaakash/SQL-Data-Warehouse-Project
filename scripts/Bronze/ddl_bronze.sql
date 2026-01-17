/*
------------------------------------------------------------------------
DDL Script: Create Bronze Tables
------------------------------------------------------------------------
Script Description : 
This script creates tables in the 'bronze' schema, dropping existing tables 
if they already exist.
*/

IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info;

GO

CREATE TABLE bronze.crm_cust_info(
	cust_id INT,
	cust_key NVARCHAR(50),
	cust_firstname NVARCHAR(50),
	cust_lastname NVARCHAR(50),
	cust_marital_status NVARCHAR(50),
	cust_gender NVARCHAR(50),
	cust_create_date DATE
);

GO

IF OBJECT_ID('bronze.crm_prod_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_prod_info;

GO

CREATE TABLE bronze.crm_prod_info(
	prod_id INT,
	prod_key NVARCHAR(50),
	prod_name NVARCHAR(100),
	prod_cost INT,
	prod_line NVARCHAR(50),
	prod_start_date DATE,
	prod_end_date DATE
);

GO

IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;

GO

CREATE TABLE bronze.crm_sales_details(
	sls_ord_id NVARCHAR(50),
	sls_prod_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);

GO

IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
	DROP TABLE bronze.erp_loc_a101;

GO

CREATE TABLE bronze.erp_loc_a101(
	cid NVARCHAR(50),
	country_name NVARCHAR(50)
);

GO

IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
	DROP TABLE bronze.erp_cust_az12;

GO

CREATE TABLE bronze.erp_cust_az12(
	cid NVARCHAR(50),
	bdate DATE,
	gender NVARCHAR(20)
);

GO

IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
	DROP TABLE bronze.erp_px_cat_g1v2;

GO

CREATE TABLE bronze.erp_px_cat_g1v2(
	id NVARCHAR(50),
	category NVARCHAR(50),
	sub_category NVARCHAR(50),
	maintenance NVARCHAR(50)
);

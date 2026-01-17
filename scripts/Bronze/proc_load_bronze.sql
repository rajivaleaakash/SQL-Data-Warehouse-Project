/*
---------------------------------------------------------------------
Store Procedure: Load Bronze Layer 
---------------------------------------------------------------------
Script Description: 
This stored procedure loads data into the 'bronze' schema from external CSV files. 
It performs the following actions:
	- Truncates the bronze tables before loading data.
	- Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
None
This store procedure does not accept any parameters or return any values.

Usage Example:
EXEC bronze.load_bronze;

*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '----------------------------------------------------';
		PRINT 'Loading Bronze Layer';
		PRINT '----------------------------------------------------';

		PRINT '----------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '-----------------------------------------------------';
	
		SET @start_time = GETDATE();
		-- Insert Data into 'crm_cust_info' table
		TRUNCATE TABLE bronze.crm_cust_info;

		BULK INSERT bronze.crm_cust_info
		FROM 'D:\Data Warehouse\data\source_crm\cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @end_time = GETDATE();
		PRINT 'Execution Time:'+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'sec';

		SET @start_time = GETDATE();
		-- Insert Data into 'crm_prod_info' table
		TRUNCATE TABLE bronze.crm_prod_info;

		BULK INSERT bronze.crm_prod_info
		FROM 'D:\Data Warehouse\data\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Execution Time:'+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'sec';


		SET @start_time = GETDATE();
		-- Insert Data into 'crm_sales_details' table
		TRUNCATE TABLE bronze.crm_sales_details;

		BULK INSERT bronze.crm_sales_details
		FROM 'D:\Data Warehouse\data\source_crm\sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Execution Time:'+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'sec';


		PRINT '------------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '------------------------------------------------------';

		SET @start_time = GETDATE();
		-- Insert Data into 'erp_cust_az12' table
		TRUNCATE TABLE bronze.erp_cust_az12;

		BULK INSERT bronze.erp_cust_az12
		FROM 'D:\Data Warehouse\data\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Execution Time:'+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'sec';


		SET @start_time = GETDATE();
		-- Insert Data into 'erp_loc_a101' table
		TRUNCATE TABLE bronze.erp_loc_a101;

		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\Data Warehouse\data\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Execution Time:'+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'sec';


		SET @start_time = GETDATE();
		-- Insert Data into 'erp_px_cat_g1v2' table
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\Data Warehouse\data\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Execution Time:'+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'sec';

		PRINT '-----------------------------------------------------';

		SET @batch_end_time = GETDATE();
		PRINT 'Total Load Duration: '+ CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + 'sec';
	END TRY
	BEGIN CATCH
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
	END CATCH
END


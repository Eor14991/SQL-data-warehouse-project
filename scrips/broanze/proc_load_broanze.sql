/*
=========================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
=========================================================
Script Purpose:
  This procedure loads data from source CSV files into
  the existing tables in the 'bronze' schema.
  For each table, it:
    1. Truncates the table.
    2. Bulk inserts data from the corresponding CSV file.
  Includes error handling to log messages if any table fails to load.

Parameters:
  None.

Example Usage:
  EXEC bronze.load_bronze
=========================================================
*/


CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    
    BEGIN TRY
        DECLARE @start_time AS DATETIME,  @end_time AS DATETIME
        DECLARE @total_start_time AS DATETIME,  @total_end_time AS DATETIME
        SET @total_start_time = GETDATE()
        
        PRINT '==================================================';
        PRINT 'Loading bronze layer';
        PRINT '==================================================';

        PRINT '--------------------------------------------------';
        PRINT 'Loading CRM Tables';
        PRINT '--------------------------------------------------';

        SET @start_time = GETDATE();
        PRINT '>> Truncating Table bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT '>> Inserting into Table bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info
        FROM '/home/m.farrag/Downloads/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>>>>> Load Duration: ' + CONVERT(VARCHAR(10), DATEDIFF(SECOND, @start_time, @end_time))+ ' seconds';
        PRINT'-----------------------------------------------------';


         SET @start_time = GETDATE();
        PRINT '>> Truncating Table bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '>> Inserting into Table bronze.crm_prd_info';
        BULK INSERT bronze.crm_prd_info
        FROM '/home/m.farrag/Downloads/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>>>>> Load Duration: ' + CONVERT(VARCHAR(10), DATEDIFF(SECOND, @start_time, @end_time))+ ' seconds';
        PRINT'-----------------------------------------------------';


         SET @start_time = GETDATE();
        PRINT '>> Truncating Table bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT '>> Inserting into Table bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details
        FROM '/home/m.farrag/Downloads/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>>>>> Load Duration: ' + CONVERT(VARCHAR(10), DATEDIFF(SECOND, @start_time, @end_time))+ ' seconds';
        PRINT'-----------------------------------------------------';


        PRINT '--------------------------------------------------';
        PRINT 'Loading ERP Tables';
        PRINT '--------------------------------------------------';
        

        SET @start_time = GETDATE();
        PRINT '>> Truncating Table bronze.erp_LOC_A101';
        TRUNCATE TABLE bronze.erp_LOC_A101;

        PRINT '>> Inserting into Table bronze.erp_LOC_A101';
        BULK INSERT bronze.erp_LOC_A101
        FROM '/home/m.farrag/Downloads/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>>>>> Load Duration: ' + CONVERT(VARCHAR(10), DATEDIFF(SECOND, @start_time, @end_time))+ ' seconds';
        PRINT'-----------------------------------------------------';


        SET @start_time = GETDATE();
        PRINT '>> Truncating Table bronze.erp_CUST_AZ12';
        TRUNCATE TABLE bronze.erp_CUST_AZ12;

        PRINT '>> Inserting into Table bronze.erp_CUST_AZ12';
        BULK INSERT bronze.erp_CUST_AZ12
        FROM '/home/m.farrag/Downloads/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>>>>> Load Duration: ' + CONVERT(VARCHAR(10), DATEDIFF(SECOND, @start_time, @end_time))+ ' seconds';
        PRINT'-----------------------------------------------------';

        SET @start_time = GETDATE();
        PRINT '>> Truncating Table bronze.erp_PX_CAT_G1V2';
        TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;

        PRINT '>> Inserting into Table bronze.erp_PX_CAT_G1V2';
        BULK INSERT bronze.erp_PX_CAT_G1V2
        FROM '/home/m.farrag/Downloads/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>>>>> Load Duration: ' + CONVERT(VARCHAR(10), DATEDIFF(SECOND, @start_time, @end_time))+ ' seconds';
        PRINT'-----------------------------------------------------';
        SET @total_end_time = GETDATE();
        PRINT '>>>>> Total Load Duration: ' + CONVERT(VARCHAR(10), DATEDIFF(SECOND, @total_start_time, @total_end_time))+ ' seconds';
PRINT'-----------------------------------------------------';

    END TRY
    BEGIN CATCH
        PRINT '=========================================';
        PRINT 'ERROR IN LOADING BRONZE LAYER';
        PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
        PRINT 'ERROR NUMBER: ' + CAST(ERROR_NUMBER() AS VARCHAR(10));
        PRINT '=========================================';
END CATCH;


END;
GO

-- Execute the procedure
EXEC bronze.load_bronze;


/*
=========================================================
DDL script: creat the Broanze Tables
=========================================================
scrip purpose:
  this script creats the tables in the 'broanze' schema, droping existing tables
  if they already exists
  run this script to re-defin the DDL structure of the 'broanze' Tables
=========================================================
*/





IF OBJECT_ID('bronze.crm_cust_info','U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info(
cst_id	int,
cst_key	NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_marital_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date Date
);
GO

IF OBJECT_ID('bronze.crm_prd_info','U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info(
prd_id	INT,
prd_key	NVARCHAR(50),
prd_nm NVARCHAR(50),
prd_cost INT,
prd_line NVARCHAR(50),
prd_start_dt Date,
prd_end_dt Date
);
GO

IF OBJECT_ID('bronze.crm_sales_details','U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num     VARCHAR(50),        -- Order number
    sls_prd_key     VARCHAR(50),        -- Product key
    sls_cust_id     INT,        -- Customer ID
    sls_order_dt    INT,        -- Order date
    sls_ship_dt     INT,            -- Shipping date
    sls_due_dt      INT,            -- Due date
    sls_sales       INT,        -- Sales amount
    sls_quantity    INT,        -- Quantity
    sls_price       INT        -- Unit price
);
GO


IF OBJECT_ID('bronze.erp_CUST_AZ12','U') IS NOT NULL
    DROP TABLE bronze.erp_CUST_AZ12;

CREATE TABLE bronze.erp_CUST_AZ12 (
    CID     VARCHAR(50),   -- Customer ID
    BDATE   DATE,                   -- Birthdate
    GEN     VARCHAR(50)                    -- Gender (e.g., 'M', 'F')
);
GO


IF OBJECT_ID('bronze.erp_LOC_A101','U') IS NOT NULL
    DROP TABLE bronze.erp_LOC_A101;
CREATE TABLE bronze.erp_LOC_A101 (
    CID     VARCHAR(100),               -- Customer ID
    CNTRY   VARCHAR(100)               -- Country
    );
    GO


    
IF OBJECT_ID('bronze.erp_PX_CAT_G1V2','U') IS NOT NULL
    DROP TABLE bronze.erp_PX_CAT_G1V2;
    CREATE TABLE bronze.erp_PX_CAT_G1V2 (
    ID           VARCHAR(50),   -- Product ID
    CAT          VARCHAR(100),               -- Category
    SUBCAT       VARCHAR(100),                   -- Subcategory
    MAINTENANCE  VARCHAR(100)                    -- Maintenance info/flag
);



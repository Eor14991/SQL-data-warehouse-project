/*
=============================================
Create Database and Schemas
=============================================

Purpose:
    - Create a database named 'DataWarehouse' after checking if it already exists.
    - If the database exists, it will be dropped and recreated automatically.
    - The script will also create three schemas: ['bronze', 'silver', 'gold'].

Warning:
    This script will drop the database if it already exists. 
    All existing data will be permanently lost.
*/
USE master;
GO

IF EXISTS(
    SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse'
)
BEGIN 
    ALTER DATABASE DataWarehouse SET single_user WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse
    END;

    GO

---- create database
CREATE DATABASE DataWarehouse;

USE DataWarehouse;
GO


----- create schemas

CREATE SCHEMA bronse;
GO


CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO


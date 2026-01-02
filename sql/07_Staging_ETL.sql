USE WalmartSalesDB;
GO

-- Drop staging table if it exists (version-safe)
IF OBJECT_ID('dbo.WalmartSales_Staging', 'U') IS NOT NULL
    DROP TABLE dbo.WalmartSales_Staging;
GO

-- Raw staging table (all columns as VARCHAR)
CREATE TABLE dbo.WalmartSales_Staging (
    Store VARCHAR(10),
    Sale_Date VARCHAR(50),
	Weekly_Sales VARCHAR(50),
    Holiday_Flag VARCHAR(10),
    Temperature VARCHAR(50),
	Fuel_Price VARCHAR(50),
	CPI VARCHAR(50),
	Unemployment VARCHAR(50),
    Source_File VARCHAR(255),
    Ingestion_Time DATETIME DEFAULT GETDATE()
);
GO
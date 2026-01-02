USE WalmartSalesDB;
GO

IF OBJECT_ID('dbo.Dim_Store', 'U') IS NOT NULL
    DROP TABLE dbo.Dim_Store;
GO

CREATE TABLE dbo.Dim_Store (
    Store_Key INT IDENTITY(1,1) PRIMARY KEY,
    Store_ID INT UNIQUE
);
GO


INSERT INTO dbo.Dim_Store (Store_ID)
SELECT DISTINCT
    CAST(Store AS INT)
FROM dbo.WalmartSales_Staging
WHERE ISNUMERIC(Store) = 1;
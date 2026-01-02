USE WalmartSalesDB;
GO

BULK INSERT dbo.WalmartSales_Staging
FROM 'C:\Users\risha\Desktop\Walmart-Sales-DBMS\walmart-sales-dataset-of-45stores.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0d0a',
    TABLOCK
);
GO


SELECT COUNT(*) AS RowsLoaded FROM dbo.WalmartSales_Staging;
SELECT TOP 10 * FROM dbo.WalmartSales_Staging;

IF OBJECT_ID('dbo.Fact_WeeklySales', 'U') IS NOT NULL
    DROP TABLE dbo.Fact_WeeklySales;
GO

CREATE TABLE dbo.Fact_WeeklySales (
    Fact_ID INT IDENTITY(1,1) PRIMARY KEY,
    Store_Key INT,
    Sale_Date DATE,
    Weekly_Sales DECIMAL(18,2),
    Holiday_Flag BIT,
    Temperature DECIMAL(10,2),
    Fuel_Price DECIMAL(10,3),
    CPI DECIMAL(10,4),
    Unemployment DECIMAL(10,3),
    Load_Time DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Store FOREIGN KEY (Store_Key)
        REFERENCES dbo.Dim_Store(Store_Key)
);
GO


SELECT COUNT(*) FROM dbo.WalmartSales_Staging;

SELECT COUNT(*) FROM dbo.Dim_Store;



USE WalmartSalesDB;
GO

INSERT INTO dbo.Fact_WeeklySales (
    Store_Key,
    Sale_Date,
    Weekly_Sales,
    Holiday_Flag,
    Temperature,
    Fuel_Price,
    CPI,
    Unemployment
)
SELECT
    ds.Store_Key,
    TRY_CONVERT(DATE, ws.Sale_Date),
    TRY_CONVERT(DECIMAL(18,2), ws.Weekly_Sales),
    CASE 
        WHEN ws.Holiday_Flag IN ('1', 'true', 'TRUE') THEN 1
        ELSE 0
    END,
    TRY_CONVERT(DECIMAL(10,2), ws.Temperature),
    TRY_CONVERT(DECIMAL(10,3), ws.Fuel_Price),
    TRY_CONVERT(DECIMAL(10,4), ws.CPI),
    TRY_CONVERT(DECIMAL(10,3), ws.Unemployment)
FROM dbo.WalmartSales_Staging ws
JOIN dbo.Dim_Store ds
    ON ds.Store_ID = TRY_CONVERT(INT, ws.Store)
WHERE
    TRY_CONVERT(DATE, ws.Sale_Date) IS NOT NULL
    AND TRY_CONVERT(DECIMAL(18,2), ws.Weekly_Sales) IS NOT NULL;
GO


SELECT COUNT(*) AS FactRows FROM dbo.Fact_WeeklySales;
SELECT TOP 10 * FROM dbo.Fact_WeeklySales;

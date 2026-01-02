USE WalmartSalesDB;
GO

-- Index for date-based analytics
CREATE INDEX idx_FactWeeklySales_SaleDate
ON dbo.Fact_WeeklySales (Sale_Date);

-- Index for store-based analytics
CREATE INDEX idx_FactWeeklySales_StoreKey
ON dbo.Fact_WeeklySales (Store_Key);

-- Composite index for common queries
CREATE INDEX idx_FactWeeklySales_StoreDate
ON dbo.Fact_WeeklySales (Store_Key, Sale_Date);
GO



SELECT 
    i.name AS IndexName,
    i.type_desc AS IndexType
FROM sys.indexes i
WHERE i.object_id = OBJECT_ID('dbo.Fact_WeeklySales')
  AND i.name IS NOT NULL;
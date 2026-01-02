IF NOT EXISTS (
    SELECT 1 FROM sys.indexes 
    WHERE name = 'idx_FactWeeklySales_SaleDate'
      AND object_id = OBJECT_ID('dbo.Fact_WeeklySales')
)
BEGIN
    CREATE INDEX idx_FactWeeklySales_SaleDate
    ON dbo.Fact_WeeklySales (Sale_Date);
END;
GO



/* ================================
   PARTITIONING DESIGN (DOCUMENTATION ONLY)
================================

PARTITIONING DESIGN (Enterprise Edition Only)

Goal:
Partition Fact_WeeklySales by Sale_Date (Year)

Rationale:
- Improves performance for historical queries
- Enables efficient data archiving
- Common practice in enterprise data warehouses

Proposed Partition Function:

CREATE PARTITION FUNCTION pf_SalesDate (DATE)
AS RANGE RIGHT FOR VALUES (
    '2011-01-01',
    '2012-01-01',
    '2013-01-01'
);

Proposed Partition Scheme:

CREATE PARTITION SCHEME ps_SalesDate
AS PARTITION pf_SalesDate
ALL TO ([PRIMARY]);

Limitation:
SQL Server Express / Standard Edition does NOT support partitioning.
This design is documented for enterprise-scale environments.
*/




IF NOT EXISTS (
    SELECT 1 FROM sys.indexes
    WHERE name = 'idx_FactWeeklySales_SaleDate'
      AND object_id = OBJECT_ID('dbo.Fact_WeeklySales')
)
BEGIN
    CREATE INDEX idx_FactWeeklySales_SaleDate
    ON dbo.Fact_WeeklySales (Sale_Date);
END;
GO

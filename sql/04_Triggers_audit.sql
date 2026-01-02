--Create Audit Table--

USE WalmartSalesDB;
GO

IF OBJECT_ID('dbo.Sales_Audit', 'U') IS NOT NULL
    DROP TABLE dbo.Sales_Audit;
GO

CREATE TABLE dbo.Sales_Audit (
    Audit_ID INT IDENTITY(1,1) PRIMARY KEY,
    SaleID INT,
    Operation_Type VARCHAR(10),      -- INSERT / UPDATE / DELETE
    Old_Quantity INT NULL,
    New_Quantity INT NULL,
    Change_Date DATETIME DEFAULT GETDATE(),
    Changed_By SYSNAME DEFAULT SYSTEM_USER
);
GO


--INSERT Trigger on Sales--

CREATE TRIGGER trg_Sales_Insert
ON dbo.Sales
AFTER INSERT
AS
BEGIN

	SET NOCOUNT ON;


    INSERT INTO dbo.Sales_Audit (
        SaleID,
        Operation_Type,
        New_Quantity
    )
    SELECT
        i.SaleID,
        'INSERT',
        i.Quantity
    FROM inserted i;
END;
GO


--UPDATE Trigger on Sales--

CREATE TRIGGER trg_Sales_Update
ON dbo.Sales
AFTER UPDATE
AS
BEGIN

	SET NOCOUNT ON;


    INSERT INTO dbo.Sales_Audit (
        SaleID,
        Operation_Type,
        Old_Quantity,
        New_Quantity
    )
    SELECT
        d.SaleID,
        'UPDATE',
        d.Quantity,
        i.Quantity
    FROM deleted d
    JOIN inserted i
        ON d.SaleID = i.SaleID;
END;
GO


--DELETE Trigger on Sales--

CREATE TRIGGER trg_Sales_Delete
ON dbo.Sales
AFTER DELETE
AS
BEGIN

	SET NOCOUNT ON;


    INSERT INTO dbo.Sales_Audit (
        SaleID,
        Operation_Type,
        Old_Quantity
    )
    SELECT
        d.SaleID,
        'DELETE',
        d.Quantity
    FROM deleted d;
END;
GO


SELECT TOP 20 * FROM dbo.Sales_Audit ORDER BY Change_Date DESC;

USE WalmartSalesDB;
GO

-- Stored Procedure
CREATE PROCEDURE dbo.GetProductPrice
    @ProductID INT
AS
BEGIN
    SELECT 
        ProductID,
        ProductName,
        Price
    FROM Products
    WHERE ProductID = @ProductID;
END;
GO

-- User-Defined Function
CREATE FUNCTION dbo.CalculateTotalPrice
(
    @Price DECIMAL(10,2),
    @Quantity INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN (@Price * @Quantity);
END;
GO
USE WalmartSalesDB;
GO

-- View 1: Product Sales Summary
CREATE VIEW ProductSalesInfo AS
SELECT 
    p.ProductID,
    p.ProductName,
    p.Category,
    SUM(s.Quantity) AS TotalUnitsSold,
    SUM(s.Quantity * p.Price) AS TotalRevenue
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName, p.Category;
GO

-- View 2: Customer Transaction History
CREATE VIEW CustomerTransaction AS
SELECT
    c.CustomerID,
    c.CustomerName,
    s.SaleID,
    s.SaleDate,
    t.TotalAmount
FROM Customers c
JOIN Sales s ON c.CustomerID = s.CustomerID
JOIN Transactions t ON s.SaleID = t.SaleID;
GO

-- View 3: Inventory Supplier Overview
CREATE VIEW InvntorySupliers AS
SELECT
    i.InventoryID,
    p.ProductName,
    s.SupplierName,
    i.StockQuantity,
    i.LastUpdated
FROM Inventory i
JOIN Products p ON i.ProductID = p.ProductID
JOIN Suppliers s ON i.SupplierID = s.SupplierID;
GO

USE WalmartSalesDB;
GO

-- SUPPLIERS
INSERT INTO Suppliers (SupplierName, ContactEmail)
VALUES 
('Global Supplies', 'contact@globalsupplies.com'),
('Fresh Foods Ltd', 'sales@freshfoods.com');

-- PRODUCTS
INSERT INTO Products (ProductName, Category, Price)
VALUES
('Milk', 'Dairy', 2.50),
('Bread', 'Bakery', 1.80),
('Eggs', 'Poultry', 3.20);

-- STORE
INSERT INTO Store (StoreLocation, ManagerName)
VALUES
('Phoenix, AZ', 'John Smith'),
('Tempe, AZ', 'Emily Davis');

-- CUSTOMERS
INSERT INTO Customers (CustomerName, Email, Phone)
VALUES
('Alice Brown', 'alice@gmail.com', '1234567890'),
('Bob Green', 'bob@gmail.com', '9876543210');

-- INVENTORY
INSERT INTO Inventory (ProductID, SupplierID, StockQuantity)
VALUES
(1, 1, 100),
(2, 2, 150),
(3, 1, 200);

-- SALES
INSERT INTO Sales (ProductID, CustomerID, StoreID, Quantity)
VALUES
(1, 1, 1, 2),
(2, 2, 2, 1);

-- TRANSACTIONS
INSERT INTO Transactions (SaleID, TotalAmount)
VALUES
(1, 5.00),
(2, 1.80);
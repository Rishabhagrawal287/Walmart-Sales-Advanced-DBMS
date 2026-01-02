USE WalmartSalesDB;
GO

-- PRODUCTS
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2) NOT NULL
);
GO

-- CUSTOMERS
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    CreatedDate DATETIME DEFAULT GETDATE()
);
GO

-- SUPPLIERS
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName VARCHAR(100),
    ContactEmail VARCHAR(100)
);
GO

-- STORE
CREATE TABLE Store (
    StoreID INT PRIMARY KEY IDENTITY(1,1),
    StoreLocation VARCHAR(100),
    ManagerName VARCHAR(100)
);
GO

-- SALES
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    CustomerID INT,
    StoreID INT,
    Quantity INT,
    SaleDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StoreID) REFERENCES Store(StoreID)
);
GO

-- TRANSACTIONS
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    SaleID INT,
    TotalAmount DECIMAL(10,2),
    TransactionDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID)
);
GO

-- INVENTORY
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    SupplierID INT,
    StockQuantity INT,
    LastUpdated DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
GO
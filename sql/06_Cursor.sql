USE WalmartSalesDB;
GO

DECLARE 
    @ProductID INT,
    @ProductName VARCHAR(100),
    @Price DECIMAL(10,2);

-- Cursor to iterate through Products
DECLARE product_cursor CURSOR FOR
SELECT ProductID, ProductName, Price
FROM Products;

OPEN product_cursor;

FETCH NEXT FROM product_cursor 
INTO @ProductID, @ProductName, @Price;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 
        'ProductID: ' + CAST(@ProductID AS VARCHAR) +
        ', ProductName: ' + @ProductName +
        ', Price: ' + CAST(@Price AS VARCHAR);

    FETCH NEXT FROM product_cursor 
    INTO @ProductID, @ProductName, @Price;
END;

CLOSE product_cursor;
DEALLOCATE product_cursor;
GO
CREATE DATABASE ECommerceDB
-- Import file csv to DB
-- https://www.youtube.com/watch?v=4JadZq2PjZQ

-- Add foreign key

ALTER TABLE [dbo].[Products]
ADD FOREIGN KEY([SupplierID]) REFERENCES [dbo].[Suppliers]([SupplierID])

ALTER TABLE [dbo].[Orders]
ADD FOREIGN KEY([CustomerID]) REFERENCES [dbo].[Customers]([CustomerID])

ALTER TABLE [dbo].[OrderDetails]
ADD FOREIGN KEY([OrderID]) REFERENCES [dbo].[Orders]([OrderID])

ALTER TABLE [dbo].[OrderDetails]
ADD FOREIGN KEY([ProductID]) REFERENCES [dbo].[Products]([ProductID])

-- Basic SQL Tasks
-- Task 1. List all customers from New Tracy

SELECT
	*
FROM
	Customers
WHERE
	Location = 'New Tracy';

-- Task 2. Insert a new product

INSERT INTO [dbo].[Products] (ProductID, Name, Category, Price, SupplierID, StockQuantity) VALUES
(501, 'Stone', 'Toys & Games', 1000.1, 2, 200)

-- Task 3. Update the stock quantity of a product

UPDATE 
	[dbo].[Products]
SET
	StockQuantity = 150
WHERE
	ProductID = 501;

-- Task 4. Delete a customer record

DELETE FROM
	Customers
WHERE
	CustomerID = 101;

-- Intermediate SQL Tasks
-- Task 5. Find the average price of all products in the 'Electronics' category

SELECT
	AVG(Price) AS AveragePrice
FROM
	Products
WHERE
	Category = 'Electronics';

-- Task 6. List the top 5 most expensive products in each category

SELECT 
    *
FROM 
    Products p1
WHERE 
    (SELECT COUNT(*) 
     FROM Products p2 
     WHERE p2.Category = p1.Category AND p2.Price > p1.Price) < 5
ORDER BY 
    Category, Price DESC;

-- Task 7. Find the total number of orders placed in 2023

SELECT
	COUNT(*) AS TotalOrders
FROM
	Orders
WHERE
	YEAR(OrderDate) = 2023;

-- Advanced Data Manipulation Tasks
-- Task 8. Change the category of all products with less than 20 in stock to 'Clearance'

UPDATE
	Products
SET
	Category = 'Clearance'
WHERE
	StockQuantity < 20;

-- Task 9. Find customers who have placed more than 3 orders

SELECT
	c.CustomerID, c.Name, COUNT(*) AS OrderCount
FROM
	Customers c
JOIN
	Orders o
ON
	o.CustomerID = c.CustomerID
GROUP BY
	c.CustomerID, c.Name
HAVING
	COUNT(*) > 3;

-- Advanced SQL Concepts and Joins Tasks
-- Task 10. List all products that have never been ordered

SELECT
	p.ProductID, p.Name, p.Category, p.Price
FROM
	Products p
LEFT JOIN
	OrderDetails od
ON
	p.ProductID = od.ProductID
WHERE
	od.OrderDetailID IS NULL;

-- Task 11. Find the total sales amount for each customer

SELECT 
    c.CustomerID, 
    c.Name, 
    SUM(od.Quantity * od.UnitPrice) AS TotalSalesAmount
FROM 
    Orders o
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
GROUP BY 
    c.CustomerID, c.Name;

-- Task 12. Identify products supplied by more than one supplier

SELECT 
    ProductID, 
    Name, 
    COUNT(DISTINCT SupplierID) AS SupplierCount
FROM 
    Products
GROUP BY 
    ProductID, Name
HAVING 
    COUNT(DISTINCT SupplierID) > 1;

-- Task 13. List all customers who ordered a specific product (e.g., ProductID = 100)

SELECT DISTINCT 
    c.CustomerID, 
    c.Name, 
    c.Email
FROM 
    Orders o
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
WHERE 
    od.ProductID = 100;

-- Task 14. Find the top 3 most popular product categories based on the number of orders

SELECT TOP 3
    p.Category, 
    COUNT(*) AS NumberOfOrders
FROM 
    Orders o
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.Category
ORDER BY 
    NumberOfOrders DESC;

-- Task 15. Calculate the monthly sales totals for the current year, broken down by product category

SELECT 
    p.Category,
    MONTH(o.OrderDate) AS Month,
    SUM(od.Quantity * od.UnitPrice) AS MonthlySalesTotal
FROM 
    Orders o
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Products p ON od.ProductID = p.ProductID
WHERE 
    YEAR(o.OrderDate) = YEAR(GETDATE())
GROUP BY 
    p.Category, MONTH(o.OrderDate)
ORDER BY 
    p.Category, Month;

-- Task 16. Identify customers who have only ordered products from one specific category (e.g., 'Electronics')

SELECT 
    c.CustomerID, 
    c.Name
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    c.CustomerID, c.Name
HAVING 
    COUNT(DISTINCT p.Category) = 1 AND MAX(p.Category) = 'Electronics';

-- Task 17. List the average, minimum, and maximum prices of products ordered by each customer, along with the total number of orders

SELECT 
    c.CustomerID,
    c.Name,
    AVG(od.UnitPrice) AS AveragePrice,
    MIN(od.UnitPrice) AS MinimumPrice,
    MAX(od.UnitPrice) AS MaximumPrice,
    COUNT(DISTINCT o.OrderID) AS TotalOrders
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY 
    c.CustomerID, c.Name;

-- Task 18. Find all products that have a price above the average price of products in their category

SELECT 
    p1.ProductID,
    p1.Name,
    p1.Category,
    p1.Price
FROM 
    Products p1
JOIN 
    Products p2 ON p1.Category = p2.Category
GROUP BY 
    p1.ProductID, p1.Name, p1.Category, p1.Price
HAVING 
    p1.Price > AVG(p2.Price);

-- Task 19. Determine the total sales (quantity * unit price) for each supplier

SELECT 
    p.SupplierID,
    s.Name AS SupplierName,
    SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
JOIN 
    Suppliers s ON p.SupplierID = s.SupplierID
GROUP BY 
    p.SupplierID, s.Name;

-- Task 20. Identify the most recent order date for each customer

SELECT 
    c.CustomerID,
    c.Name,
    MAX(o.OrderDate) AS MostRecentOrderDate
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.CustomerID, c.Name;

-- Task 21. Find customers who have placed orders totaling more than $5000 but have not made any orders in the last 6 months

SELECT 
    c.CustomerID,
    c.Name
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
WHERE 
    o.OrderDate < DATEADD(MONTH, -6, GETDATE())
GROUP BY 
    c.CustomerID, c.Name
HAVING 
    SUM(od.Quantity * od.UnitPrice) > 5000
AND 
    NOT EXISTS (
        SELECT 1
        FROM Orders o2
        WHERE o2.CustomerID = c.CustomerID
        AND o2.OrderDate >= DATEADD(MONTH, -6, GETDATE())
    );

-- Task 22. List all products that were never sold and are supplied by more than or equal to one supplier

SELECT 
    p.ProductID,
    p.Name,
    p.Category,
    p.Price
FROM 
    Products p
LEFT JOIN 
    OrderDetails od ON p.ProductID = od.ProductID
WHERE 
    od.ProductID IS NULL 
AND 
    p.SupplierID IS NOT NULL;

-- Task 23. Identify monthly sales totals

SELECT 
    YEAR(o.OrderDate) AS Year,
    MONTH(o.OrderDate) AS Month,
    SUM(od.Quantity * od.UnitPrice) AS MonthlySalesTotal
FROM 
    Orders o
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY 
    YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY 
    Year, Month;

-- Task 24. Determine popular product categories in different locations which have more than 1 order


SELECT 
    p.Category,
    c.Location,
    COUNT(o.OrderID) AS OrderCount
FROM 
    Orders o
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Products p ON od.ProductID = p.ProductID
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
GROUP BY 
    p.Category, c.Location
HAVING 
    COUNT(o.OrderID) > 1
ORDER BY 
    p.Category, c.Location;

-- Task 25. Evaluate suppliers based on product demand and stock levels

SELECT 
    s.SupplierID,
    s.Name AS SupplierName,
    SUM(od.Quantity) AS TotalDemand,
    SUM(p.StockQuantity) AS TotalStock
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
JOIN 
    Suppliers s ON p.SupplierID = s.SupplierID
GROUP BY 
    s.SupplierID, s.Name
ORDER BY 
    TotalDemand DESC, TotalStock DESC;









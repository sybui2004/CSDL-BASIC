CREATE TABLE Authors (
	AuthorID INT PRIMARY KEY
	, AuthorName NVARCHAR(100) NOT NULL
	, BirthYear DATE
    , Nationality NVARCHAR(50)
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY
	, Title NVARCHAR(200) NOT NULL
	, AuthorID INT NOT NULL
	, FOREIGN KEY (AuthorID) REFERENCES [Authors](AuthorID)
    , Genre NVARCHAR(100)
	, Price FLOAT NOT NULL
    , PublishDate DATE
);

CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY
	, CustomerName NVARCHAR (50)
	, Email NVARCHAR (50)
	, JoinDate DATE
);

CREATE TABLE Sales (
	SaleID INT PRIMARY KEY
	, BookID INT NOT NULL
	, CustomerID INT NOT NULL
	, FOREIGN KEY (BookID) REFERENCES [Books](BookID)
	, FOREIGN KEY (CustomerID) REFERENCES [Customers](CustomerID)
	, SaleDate DATE
	, Quantity INT
	, TotalPrice FLOAT
);

-- Basic Data Manipulation Tasks
-- 1. Insert New Records
INSERT INTO Books (BookID, Title, AuthorID, Genre, Price, PublishDate) VALUES
(201, 'The adventure of Sinbad.', 11, 'Adventure', 45.7, '2010-04-25'),
(202, 'The Battle of Dien Bien Phu.', 22, 'Historical', 25.69, '2015-07-11'),
(203, 'Romeo and Juliet.', 33, 'Romance', 67.39, '2018-10-15')

INSERT INTO Authors (AuthorID, AuthorName, BirthYear, Nationality) VALUES 
(201, 'BTS', '2004-09-20', 'Vietnam'),
(202, 'NTC', '2004-09-19', 'Vietnam'),
(203, 'NMK', '2004-01-20', 'Vietnam')
-- 2. Update Existing Records
SELECT *
FROM Books
WHERE Genre = 'Fantasy';

UPDATE Books
SET Price = Price * 1.1
WHERE Genre = 'Fantasy';

SELECT *
FROM Customers
WHERE CustomerID = 10;

UPDATE Customers
SET Email = 'a' + Email
WHERE CustomerID = 10;
-- 3. Delete Records

DELETE FROM Books
WHERE PublishDate < '2000-01-01';

DELETE FROM Sales
WHERE CustomerID = 6;

DELETE FROM Customers
WHERE CustomerID = 6;

-- Intermediate Querying Tasks
-- 1. Filtering and Sorting

SELECT * 
FROM Books
WHERE (Genre = 'Science Fiction' OR Genre = 'Mystery') AND Price > 20
ORDER BY Price DESC;

SELECT *
FROM Customers
WHERE JoinDate > '2020-01-01' AND Email LIKE '%@gmail.com';

-- 2. Aggregate Functions

SELECT Genre, COUNT(*) AS NumberOfBooksClassifiedByGenre
FROM Books
GROUP BY Genre

SELECT YEAR(SaleDate) AS SaleYear, AVG(TotalPrice) AS AverageTotalPrice
FROM Sales
GROUP BY YEAR(SaleDate)
ORDER BY SaleYear;

-- 3. Grouping Data

SELECT A.AuthorName, COUNT(*) AS NumberOfBooks
FROM [dbo].[Authors] AS A
JOIN [dbo].[Books] AS B ON A.AuthorID = B.AuthorID
GROUP BY A.AuthorName
ORDER BY NumberOfBooks DESC

SELECT C.CustomerName, SUM(S.TotalPrice) AS Total
FROM Customers AS C
JOIN Sales AS S ON C.CustomerID = S.CustomerID
GROUP BY C.CustomerName
HAVING SUM(S.TotalPrice) > 200
ORDER BY Total

-- Advanced Data Manipulation Tasks
-- 1. Complex Conditions
SELECT BookID, Title, Price,
    CASE 
        WHEN Price < 20 THEN 'Cheap'
        WHEN Price BETWEEN 20 AND 50 THEN 'Moderate'
        ELSE 'Expensive'
    END AS PriceCategory
FROM Books

UPDATE Sales
SET TotalPrice = TotalPrice * 0.95
WHERE Quantity > 3;

-- 2. Subqueries and Advanced Updates/Deletes

UPDATE S
SET S.TotalPrice = S.TotalPrice * 0.9
FROM Sales AS S
JOIN Books AS B ON S.BookID = B.BookID
JOIN Authors AS A ON B.AuthorID = A.AuthorID
WHERE YEAR(A.BirthYear) < '1970';


DELETE FROM Sales
WHERE BookID IN (
    SELECT DISTINCT BookID
    FROM Sales
    WHERE SaleDate < DATEADD(YEAR, -1, GETDATE())
);


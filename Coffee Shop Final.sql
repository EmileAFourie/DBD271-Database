USE master

if exists (select * from sysdatabases where name='CoffeeShop')
           drop database CoffeeShop

GO

CREATE DATABASE Shop
ON PRIMARY
(NAME='CoffeeShopData', FILENAME = 'C:\DBD2781 Project\Data.mdf', SIZE=10MB, MAXSIZE=20, FILEGROWTH=10%)
LOG ON
(NAME= 'CoffeeShopLog', FILENAME = 'C:\DBD2781 Project\Log.ldf', SIZE=10MB, MAXSIZE=200, FILEGROWTH=20%);

GO

--

Go
USE Shop
CREATE TABLE Categories (
CategoryID int IDENTITY (1,1) NOT NULL,
CategoryName NVARCHAR(25) NOT NULL,
Description NVARCHAR(50) NOT NULL,
CONSTRAINT PK_Category PRIMARY KEY CLUSTERED (CategoryID))

--Add nog references sal doen na al die tables created is
USE Shop
GO
CREATE INDEX CategoryName ON "dbo". "Categories"("CategoryName")
USE Shop
GO
CREATE INDEX Description ON "dbo". "Categories"(Description)

INSERT INTO Categories(CategoryName, Description)
VALUES
('Cold Beverages', 'Soft drinks'),
('Hot Beverages', 'Coffee, tea, cappuccino'),
('Snacks', 'Cookies, brownies, fudge'),
('Pastries', 'Croissants, scones'),
('Breads', 'Muffins'),
('Desserts', 'Cake')

--

USE Shop
GO
CREATE TABLE Customers (
CustomerID int IDENTITY(1,1) NOT NULL,
FirstName nVarchar(30) NULL,
Lastname nVarchar (30) null,
Cellphone nvarchar (12)null,

CONSTRAINT PK_Customers PRIMARY KEY CLUSTERED
(
CustomerID
),
)
USE Shop
GO
 CREATE  INDEX Cellphone ON Customers(Cellphone)

 INSERT INTO Customers ( FirstName, Lastname, Cellphone)
VALUES
('Harriett ','Cooper', '084 735 3901'),
('Simra ','Zavala', '085 275 0655'),
('Alaina ','Haley', '084 140 2419'),
('Usama ','Sullivan', '084 858 4309'),
('Keisha ','Woodcock', '082 480 2079'),
('Theon ','Bridges', '083 315 1555'),
('Fahmida ','Dalby', '083 408 5072'),
('Zoya ','Cash', '085 945 9575'),
('Beauden ','Mcfarlane', '084 602 9859'),
('Bert ','Pratt', '085 890 2568')

 --

 GO
USE Shop
CREATE TABLE OrderDetails (
OrderID int IDENTITY(1,1) NOT NULL,
ProductID int NOT NULL,
UnitPrice money NULL CONSTRAINT DF_OrderDetails_UnitPrice DEFAULT (0),
Quantity smallint  NOT NULL CONSTRAINT "DF_OrderDetails_Quantity" DEFAULT (1),
Discount real NOT NULL CONSTRAINT "DF_OrderDetails_Discount" DEFAULT (0))

INSERT INTO OrderDetails (ProductID, UnitPrice, Quantity, Discount)
VALUES 
(1 , 20, 2, 0.0), 
(1 , 30, 1, 0.0), 
(2 , 10, 1, 0.0), 
(2 , 40, 3, 0.05), 
(2 , 10, 2, 0.05),
(3 , 22, 4, 0.10), 
(4 , 25, 2, 0.0), 
(4 , 15, 1, 0.0), 
(5 , 35, 1, 0.0), 
(6 , 25, 1, 0.0)

--

Go
Use Shop

CREATE TABLE Orders (
OrderID int IDENTITY(1,1) NOT NULL,
CustomerID int  NULL,
EmployeeID int NULL,
OrderDate datetime NULL)

INSERT INTO Orders(CustomerID, EmployeeID, OrderDate)
VALUES 
(1 , 2, GETDATE()),
(1 , 2, GETDATE()),
(2 , 2, GETDATE()),
(3 , 2, GETDATE()), 
(4 , 2, GETDATE()),
(5 , 2, GETDATE()),
(5 , 2, GETDATE()),
(5 , 2, GETDATE()),
(6 , 9, GETDATE()),
(6 , 9, GETDATE()),
(7 , 9, GETDATE()),
(7 , 9, GETDATE()), 
(8 , 9, GETDATE()),
(8 , 2, GETDATE()), 
(8 , 2, GETDATE()),
(9 , 2, GETDATE()),
(10 , 9, GETDATE()),
(11 , 2, GETDATE()),
(12 , 9, GETDATE()),
(13 , 2, GETDATE())

--

USE Shop
CREATE TABLE Products (
ProductID int IDENTITY (1,1) NOT NULL,
ProductName NVARCHAR(25) NOT NULL,
SupplierID int NULL,
CategoryID int NULL,
UnitsPerBox NVARCHAR(255) NULL,
UnitPrice money NULL CONSTRAINT DF_Products_UnitPrice DEFAULT (0),
UnitsINStock smallint NULL CONSTRAINT DF_Products_UnitsINStock DEFAULT (0),
UnitsONOrder smallint NULL CONSTRAINT DF_Products_UnitsONOrder DEFAULT (0))

go 

INSERT INTO Products (ProductName, SupplierID, CategoryID, UnitsPerBox, UnitPrice, UnitsInStock, UnitsONOrder)
VALUES
('Americano', 6, 2, 1, '21.00', 92, 0),
('Espresso', 6, 2, 1, '15.00', 20, 15),
('Choclate Croissant', 1,2, 1, '30.00', 20, 10),
('Macchiato', 6, 2, 1, '17.00', 55, 0),
('Scones', 4, 2, 1, '25.00', 20, 10),
('Con Panna', 6, 2, 1, '20.00', 33, 20),
('Cappucino', 6, 2, 1, '29.00', 90, 0),
('Caffee Mocha', 6, 2, 1, '30.00', 47, 0),
('Brownies', 4, 3, 5, '20.00', 8, 20),
('Caffe Latte', 4, 2, 1, '30.00', 68, 0),
('Hot Chcolate', 4, 2, 1, '30.00', 70, 0),
('Cake of the Day', 10, 6, 1, '35.00', 10, 10),
('Milo', 1, 2, 1, '30.00', 82, 0),
('Chai Latte', 2, 2, 1, '29.00', 40, 0),
('Dirty Chai Latte', 2, 2, 1, '39.00', 102, 0),
('Red Cappucino', 2, 2, 1, '28.00', 100, 0),
('Ceylon Tea', 5, 2, 1, '20.00', 42, 0),
('Choclate Muffin', 1, 5, 1, '30.00', 17, 22),
('Bran Muffin', 1, 5, 1, '30.00', 13, 30),
('Blueberry Muffin', 1, 5, 1, '30.00', 18, 10),
('Earl Grey Tea', 5, 2, 1, '20.00', 60, 0),
('Fudge', 8, 3, 5, '20.00', 10, 20),
('Peanut Butter Cookies', 7, 3, 10, '30.00', 12, 10),
('Rooibos Tea', 5, 2, 1, '20.00', 11, 45),
('Chocolate Chip Cookies', 7, 3, 10, '30.00', 10, 10),
('Ginger Cookies', 7, 3, 10, '30.00', 10, 10),
('Coke', 2, 1, 1, '21.00', 25, 50),
('Coke Zero', 2, 1, 1, '21.00', 20, 50),
('Sprite', 2, 1, 1, '21.00', 17, 50),
('Fanta Orange', 2, 1, 1, '21.00', 36, 0),
('Fanta Grape', 2, 1, 1, '21.00', 28, 0),
('Cream Soda', 2, 1, 1, '21.00', 40, 0),
('Still Water', 2, 1, 1, '21.00', 33, 0),
('Peach Ice Tea', 3, 1, 1, '25.00', 20, 40),
('Berry Ice Tea', 3, 1, 1, '25.00', 18, 40),
('Lemon Ice Tea', 3, 1, 1, '25.00', 16, 40)

go

--

USE Shop
GO
CREATE TABLE Staff (
EmployeeID int IDENTITY(1,1) NOT NULL,
FirstName Varchar(30) NOT NULL,
Lastname Varchar (30) Not Null,
Position varchar (30) not null,
Title Varchar (5) NULL,
Birthdate datetime null,
HireDate datetime null,
[Address] nvarchar (30) null,
City nvarchar (30) null,
Province nvarchar (30) null,
HomePhone nvarchar (30) null,


CONSTRAINT PK_Employees PRIMARY KEY  CLUSTERED 
	(
		EmployeeID
	),
	CONSTRAINT FK_Staff_Employees FOREIGN KEY 
	(
		EmployeeID
	) REFERENCES Staff (
		EmployeeID
	),
	CONSTRAINT CK_BirthDate CHECK (BirthDate < getdate())
)
USE Shop
GO
 CREATE  INDEX LastName ON Staff(LastName)
 USE Shop
GO
 CREATE  INDEX PostalCode ON Staff(Position)
 USE Shop
GO

INSERT INTO Staff(FirstName, Lastname, Position, Title, Birthdate, HireDate, [Address], City, Province, HomePhone)
VALUES
('Tristen', 'Baird', 'Barista' , 'Mr', '2001-08-06', '2020-02-01', '1838 Bhoola Rd', 'Pretoria', 'Gauteng', '085 603 4684'),
('Kash', 'Davenport', 'Cashier', 'Mrs', '1998-07-25', '2019-06-11', '2337 Oranje St', 'Pretoria', 'Gauteng', '082 731 4767'),
('Neveah', 'Montes', 'Barista' , 'Mrs', '2002-11-11', '2021-05-01', '1262 Old Cres', 'Pretoria', 'Gauteng', '084 421 3094'),
('Amari', 'Hanson', 'Cleaner' , 'Mrs', '2000-05-22', '2020-02-01', '1365 Wattle St', 'Pretoria', 'Gauteng', '083 470 2909 '),
('Cade', 'Vincent', 'Store Manager' , 'Mr', '1996-02-17', '2017-07-15', '2196 Akasia St', 'Pretoria', 'Gauteng', '085 695 9238'),
('Miles', 'Greene', 'Marketing Manager' , 'Mrs', '1999-12-12', '2022-03-1', '1644 Tait St', 'Pretoria', 'Gauteng', '084 941 7156'),
('Ada', 'Munoz', 'Social media manager' , 'Mrs', '1999-03-23', '2018-09-15', '1979 Bezuidenhout St', 'Pretoria', 'Gauteng', '084 445 8470'),
('Kate', 'Washington', 'Barista' , 'Mr', '2001-06-12', '2022-02-01', '675 Willow St', 'Pretoria', 'Gauteng', '082 607 0289'),
('Ellie', 'Cooper', 'Cashier' , 'Mr', '1998-07-19', '2019-10-01', '1833 Barlow Street', 'Pretoria', 'Gauteng', '084 332 7225'),
('Marie', 'Mcgee', 'Assistant Store Manager' , 'Mrs', '1999-02-27', '2020-06-15', '2042 Dorp St', 'Pretoria', 'Gauteng', '083 112 8691'),
('Miranda ', 'Turner', 'Mechanical Technician' , 'Mr', '1995-12-25', '2022-02-15', '1614 Kort St', 'Pretoria', 'Gauteng', '084 620 2433')

--


USE Shop
CREATE TABLE Suppliers (
SupplierID "int" IDENTITY (1,1) NOT NULL,
CompanyName NVARCHAR(25) NOT NULL,
ContactName NVARCHAR(50) NULL,
ContactTitle NVARCHAR(20) NULL,
[Address] NVARCHAR(50) NULL,
City NVARCHAR(20) NULL,
Region NVARCHAR(50) NULL,
PostalCode NVARCHAR(10) NULL,
Country NVARCHAR(20) NULL,
Phone NVARCHAR(15) NULL,
CONSTRAINT PK_Suppliers PRIMARY KEY CLUSTERED
(
SupplierID
),
CONSTRAINT FK_Suppliers FOREIGN KEY
(
SupplierID
)REFERENCES dbo.Suppliers (
SupplierID
),


)
USE Shop
GO
CREATE INDEX CompanyName ON "dbo". "Suppliers"("CompanyName")
USE Shop
GO
CREATE INDEX PostalCode ON "dbo". "Suppliers"("PostalCode")

INSERT INTO Suppliers (CompanyName, ContactName,ContactTitle,[Address], City, Region, PostalCode,Country, Phone)
VALUES
('Bidvest', 'Tracy Felix', 'Mrs','34 Waterfall Ave, Vintonia', 'Pretoria', 'Gauteng', '1082', 'South Africa', '084 735 3901'),
('Spar','Zavala Bevan','Mrs','7382 Park Street, Arcadia', 'Pretoria', 'Gauteng', '1022', 'South Africa', '085 275 0655'),
('Checkers','Haley Holland','Mrs', '56 Queenswood', 'Pretoria', 'Gauteng', '1012', 'South Africa','084 140 2419'),
('Woolworths','Sullivan Wilcox','Mr', '32 Lynnwood Road, Hillcrest', 'Pretoria', 'Gauteng', '1045', 'South Africa', '084 858 4309'),
('WestPack','Woodcock Oneal','Mr', '77 Sinoville', 'Pretoria', 'Gauteng', '4562', 'South Africa','082 480 2079'),
('Illy COffee','Marcos Bridges ','Mr', '1 Rivonia Road ,Sandton','Pretoria', 'Gauteng', '2082', 'South Africa', '083 315 1555'),
('Monin','Dalby Macfarlane','Mr', ' 1030 Hamois', 'Schaerbeek', 'Jpsaphat', '1182', 'Belgium', '+2734 408 5072'),
('Bakers Bin','Alastair Galvan','Mrs', '22 Ben Swart Street, Villieria', 'Pretoria', 'Gauteng', '1082', 'South Africa', '085 945 9575'),
('Clover','Mcfarlane Medina','Mrs', '344 Parkstreet, Hatfield' , 'Pretoria', 'Gauteng', '2222', 'South Africa','084 602 9859'),
('Foodlovers','Pratt Sargent','Mr', ' 12534 Bryanston,Sandton', 'Johannesburg', 'Gauteng', '1211', 'South Africa','085 890 2568')


--Logins

create login Emile with password = 'Emile'
create user Emile for login Emile 
create login Pieter with password = 'Pieter'
create user Pieter for login Pieter 
create login Damon with password = 'Damon'
create user Damon for login Damon 

go

--Trigger


CREATE TRIGGER [OrderStock]
ON OrderDetails
AFTER INSERT
AS
BEGIN
update Products
set UnitsINStock = UnitsINStock - Quantity
from Products
INNER JOIN OrderDetails
ON Products.ProductID = OrderDetails.ProductID
End

go

--View_1
CREATE OR ALTER VIEW [Mrs Title] AS
SELECT EmployeeID, FirstName, LastName, Position, Title
FROM Staff
WHERE Title = 'Mrs'

go

--View_2

CREATE VIEW [Products Above The Average Price] AS
SELECT ProductID, ProductName, UnitsPerBox, UnitPrice AS 'Average Price'
FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products);


-- Procedure that contains a certain letter in Firstname 


GO
CREATE Procedure AllCustomersContainsLetter @firstname nvarchar(30)
AS
SELECT *
FROM Customers
WHERE FirstName LIKE '%' + @firstname + '%'

-- EXECUTE AllCustomersContainsLetter @firstname = (Letter to search)




--Procedure that shows products with a certain price
GO
CREATE Procedure ProductsPrice @price money
AS
DECLARE @count int
IF(@price >= 25)
BEGIN
SELECT @count = COUNT(ProductID)
FROM Products
WHERE UnitPrice = @price
PRINT 'There are ' + CAST(@count AS varchar) + ' products with the price of: R' + CAST(@price AS varchar)
END
ELSE
BEGIN
PRINT 'There are no products with the price of R' + CAST(@price AS varchar)
END

-- EXECUTE ProductsPrice ?

/*
Cursor for Supplier details

DECLARE
@suppliername nvarchar(25),
@address nvarchar(50),
@city nvarchar(20),
@region nvarchar(50),
@country nvarchar(20)

PRINT ' '
PRINT ' ----- Supplier Details -----'
PRINT ' '

DECLARE supplierdetail CURSOR
FOR
SELECT CompanyName, Address, City, Region, Country
FROM Suppliers

OPEN supplierdetail

FETCH NEXT FROM supplierdetail
INTO @suppliername, @address, @city, @region, @country;

WHILE (@@FETCH_STATUS = 0)
BEGIN
PRINT '--------------------------------------'
PRINT 'NAME: ' + @suppliername
PRINT 'ADDRESS: ' + @address
PRINT ' ' + @city
PRINT ' ' + @region
PRINT ' ' + @country
PRINT '--------------------------------------'
PRINT ''
FETCH NEXT FROM supplierdetail
INTO @suppliername, @address, @city, @region, @country;
END;

CLOSE supplierdetail

DEALLOCATE supplierdetail

*/



--Queries for Database

/* Ammount of products that each supplier provides where Suppliers are in Pretoria

SELECT Suppliers.SupplierID, CompanyName, COUNT(Products.ProductID) AS 'Number of Products Supplied'
FROM Suppliers INNER JOIN Products ON Suppliers.SupplierID = Products.SupplierID
WHERE City = 'Pretoria'
GROUP BY Suppliers.SupplierID, CompanyName
HAVING COUNT(ProductID) > 2
ORDER BY CompanyName ASC
*/



/* Case Statement for stock status 

SELECT ProductID, ProductName, UnitsINStock,
CASE
WHEN UnitsINStock < 30 THEN 'Low Stock'
WHEN UnitsINStock < 71 THEN 'Enough Stock'
WHEN UnitsInStock < 120 THEN 'High Stock'
END AS 'Stock Status'
FROM Products;
*/


/* Ammount of products sold

SELECT Products.ProductID, ProductName, COUNT(Orders.OrderID) AS 'Sales of each Product'
FROM Products
LEFT OUTER JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
LEFT OUTER JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
GROUP BY Products.ProductID, ProductName
ORDER BY 'Sales of each Product' DESC
*/

/* Product Name where ID is 1 or 5

SELECT ProductID, ProductName, Categories.CategoryID
FROM Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE Categories.CategoryID = 1 OR Categories.CategoryID = 5
ORDER BY ProductName ASC

*/

/* Total of Orders 

SELECT Orders.OrderID, SUM(Products.UnitPrice * OrderDetails.Quantity) AS 'Order Total'
FROM Products
INNER JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
INNER JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
GROUP BY Orders.OrderID

*/


backup database SHOP
To Disk = N'Downloads'
with Noformat, Noinit,
name = N'CoffeeShopBACKUP', skip, norewind,nounload,stats = 10;
go

/* Verify Backup 

restore verifyonly 
from disk = N'Downloads';
go

*/



/* Restore backup 

Restore Database SHOP
from disk = N'Downloads'
with file = 1, nounload,stats = 5;
go

*/

--Select all from Shop to see what it contains

/*
select *
from [dbo].[Categories]
select *
from [dbo].[Customers]
select *
from [dbo].[OrderDetails]
select *
from [dbo].[Orders]
select *
from [dbo].[Products]
select *
from [dbo].[Staff]
select *
from [dbo].[Suppliers]
*/
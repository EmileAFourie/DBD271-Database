
-- All good


USE Shop
CREATE TABLE Products (
ProductID int IDENTITY (1,1) NOT NULL,
ProductName NVARCHAR(25) NOT NULL,
SupplierID int NULL,
CategoryID int NULL,
UnitsPerBox NVARCHAR(255) NULL,
UnitPrice money NULL CONSTRAINT DF_Products_UnitPrice DEFAULT (0),
UnitsINStock smallint NULL CONSTRAINT DF_Products_UnitsINStock DEFAULT (0),
UnitsONOrder smallint NULL CONSTRAINT DF_Products_UnitsONOrder DEFAULT (0)
CONSTRAINT PK_Products PRIMARY KEY CLUSTERED
(
ProductID
),
CONSTRAINT FK_Products_Suppliers FOREIGN KEY
(
SupplierID
)REFERENCES Suppliers (
SupplierID
),
CONSTRAINT FK_Products_Categories FOREIGN KEY
(
CategoryID
)REFERENCES Suppliers (
SupplierID--Add nog references sal doen na al die tables created is
),
	CONSTRAINT CK_Products_UnitPrice CHECK (UnitPrice >= 0),
	CONSTRAINT CK_UnitsINStock CHECK (UnitsInStock >= 0),
	CONSTRAINT CK_UnitsONOrder CHECK (UnitsOnOrder >= 0)
)
USE Shop
GO
 CREATE  INDEX CategoryID ON Products(CategoryID)
USE Shop
GO
 CREATE  INDEX ProductName ON Products(ProductName)
USE Shop
GO
 CREATE  INDEX SupplierID ON Products(SupplierID)





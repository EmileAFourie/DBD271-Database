
--all good

USE Shop
CREATE TABLE Suppliers (
SupplierID "int" IDENTITY (1,1) NOT NULL,
CompanyName NVARCHAR(25) NOT NULL,
ContactName NVARCHAR(50) NULL,
ContactTitle NVARCHAR(20) NULL,
Address NVARCHAR(50) NULL,
City NVARCHAR(20) NULL,
Region NVARCHAR(50) NULL,
PostalCode NVARCHAR(10) NULL,
Country NVARCHAR(20) NULL,
Phone NVARCHAR(10) NULL,
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
--Add nog references sal doen na al die tables created is
)
USE Shop
GO
CREATE INDEX CompanyName ON "dbo". "Suppliers"("CompanyName")
USE Shop
GO
CREATE INDEX PostalCode ON "dbo". "Suppliers"("PostalCode")

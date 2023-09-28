
Go
USE Shop
CREATE TABLE Categories (
CategoryID int IDENTITY (1,1) NOT NULL,
CategoryName NVARCHAR(25) NOT NULL,
Descirption NVARCHAR(50) NOT NULL,
CONSTRAINT PK_Category PRIMARY KEY CLUSTERED (CategoryID))

--Add nog references sal doen na al die tables created is
USE Shop
GO
CREATE INDEX CategoryName ON "dbo". "Categories"("CategoryName")
USE Shop
GO
CREATE INDEX Description ON "dbo". "Categories"("Descirption")

--All good
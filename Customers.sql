
USE Shop
GO
CREATE TABLE Customers (
CustomerID int IDENTITY(1,1) NOT NULL,
FirstName nVarchar NULL,
Lastname nVarchar (1) null,
Cellphone nvarchar null,

CONSTRAINT PK_Customers PRIMARY KEY CLUSTERED
(
CustomerID
),
)
USE Shop
GO
 CREATE  INDEX Cellphone ON Customers(Cellphone)

 --All Good
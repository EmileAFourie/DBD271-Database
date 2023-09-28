
-- all good
GO
USE Shop
CREATE TABLE OrderDetails (
OrderID int NOT NULL,
ProductID int  NOT NULL,
UnitPrice money NULL CONSTRAINT DF_OrderDetails_UnitPrice DEFAULT (0),
Quantity smallint NOT NULL CONSTRAINT "DF_OrderDetails_Quantity" DEFAULT (1),
Discount real NOT NULL CONSTRAINT "DF_OrderDetails_Discount" DEFAULT (0))

INSERT INTO OrderDetails (ProductID, UnitPrice, Quantity, Discount)
VALUES (1 , 20, 2, 0.0  );

INSERT INTO OrderDetails (ProductID, UnitPrice, Quantity, Discount)
VALUES (1 , 30, 1, 0.0  );

INSERT INTO OrderDetails (ProductID, UnitPrice, Quantity, Discount)
VALUES (2 , 10, 1, 0.0  );

INSERT INTO OrderDetails (ProductID, UnitPrice, Quantity, Discount)
VALUES (2 , 40, 3, 0.05  );

INSERT INTO OrderDetails (ProductID, UnitPrice, Quantity, Discount)
VALUES (2 , 10, 2, 0.05  );

INSERT INTO OrderDetails (ProductID, UnitPrice, Quantity, Discount)
VALUES (3 , 22, 4, 0.10  );

INSERT INTO OrderDetails (ProductID, UnitPrice, Quantity, Discount)
VALUES (4 , 25, 2, 0.0  );

INSERT INTO OrderDetails (ProductID, UnitPrice, Quantity, Discount)
VALUES (4 , 15, 1, 0.0  );

INSERT INTO OrderDetails (ProductID, UnitPrice, Quantity, Discount)
VALUES (5 , 35, 1, 0.0  );

INSERT INTO OrderDetails (ProductID, UnitPrice, Quantity, Discount)
VALUES (6 , 25, 1, 0.0  );

select *
from [dbo].[OrderDetails]
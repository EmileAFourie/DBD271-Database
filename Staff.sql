-- all good
USE Shop
GO
CREATE TABLE Staff (
EmployeeID int IDENTITY(1,1) NOT NULL,
FirstName Varchar NOT NULL,
Lastname Varchar (1) Not Null,
Position varchar not null,
Title Varchar NULL,
Birthdate datetime null,
HireDate datetime null,
Address nvarchar null,
City nvarchar null,
Province nvarchar null,
HomePhone nvarchar null,
Photo image null,
Reports_To nvarchar null,

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
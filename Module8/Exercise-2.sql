USE AdventureWorks2017;
GO

CREATE VIEW Sales.vCustomer
AS
SELECT CustomerID, AccountNumber, ModifiedDate 
FROM Sales.Customer;
GO

INSERT INTO Sales.vCustomer
VALUES
(1,1234, '2020-01-01'),
(2,4578, '2020-02-01');
GO


SELECT [CustomerID]
      ,[AccountNumber]
      ,[ModifiedDate]
  FROM [AdventureWorks2017].[Sales].[vCustomer]
ORDER BY CustomerID
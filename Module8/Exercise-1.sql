USE AdventureWorks2017;
GO

CREATE VIEW [dbo].[vProducts]
AS
SELECT Production.Product.ProductID, Production.Product.Name, Production.Product.ProductNumber, Production.Product.Color, Production.Product.DaysToManufacture, Production.Product.Size, Production.Product.SizeUnitMeasureCode, Production.Product.ListPrice, 
             Production.Product.Weight
FROM   Production.Product INNER JOIN
             Production.ProductListPriceHistory ON Production.Product.ProductID = Production.ProductListPriceHistory.ProductID INNER JOIN
             Production.UnitMeasure ON Production.Product.SizeUnitMeasureCode = Production.UnitMeasure.UnitMeasureCode AND Production.Product.WeightUnitMeasureCode = Production.UnitMeasure.UnitMeasureCode
GO


USE AdventureWorks2017;
GO

CREATE VIEW [dbo].[vAvailableModels]
AS
SELECT Production.Product.ProductID, Production.Product.Name, Production.ProductModel.ProductModelID, Production.ProductModel.Name AS Expr1
FROM   Production.Product INNER JOIN
             Production.ProductModel ON Production.Product.ProductModelID = Production.ProductModel.ProductModelID
GO
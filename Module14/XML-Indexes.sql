use TutorialDB
Go

create primary xml index pxml_on_product
on dbo.product(productdetails);
go

CREATE XML INDEX IXML_on_product
ON dbo.Product(ProductDetails)
USING XML INDEX pxml_on_product FOR VALUE;
GO

SELECT * FROM sys.xml_indexes;
GO

DROP TABLE dbo.Product;
GO

CREATE TABLE dbo.Product
( ProductID int IDENTITY(1,1),
  ProductDetails xml (CONTENT dbo.ProductDetailsSchema)
);

create primary xml index pxml_on_product
on dbo.product(productdetails);
go

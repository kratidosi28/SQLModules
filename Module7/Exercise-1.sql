use AdventureWorks2017;

CREATE NONCLUSTERED COLUMNSTORE INDEX NCI_ProductInventory ON Production.ProductInventory
(
	Quantity,
	rowguid,
	Shelf
)
GO
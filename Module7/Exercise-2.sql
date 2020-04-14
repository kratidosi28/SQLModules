USE [AdventureWorks2017]
GO


CREATE CLUSTERED COLUMNSTORE INDEX CCI_SalesOrderDetail ON Sales.SalesOrderDetail
GO


CREATE NONCLUSTERED INDEX [IX_SalesOrderDetail_SalesOrderId] ON [Sales].[SalesOrderDetail]
(
	[SalesOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]



CREATE NONCLUSTERED INDEX [IX_SalesOrderDetail_ModifiedDate] ON [Sales].[SalesOrderDetail]
(
	[ModifiedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


CREATE NONCLUSTERED INDEX [IX_SalesOrderDetail_UnitPrice] ON [Sales].[SalesOrderDetail]
(
	[UnitPrice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]





ALTER TABLE [sales].[SalesOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [Sales].[Product] ([ProductId])
GO
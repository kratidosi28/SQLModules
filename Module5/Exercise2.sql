ALTER TABLE Sales.MediaOutlet ADD CONSTRAINT IX_MediaOutlet UNIQUE CLUSTERED (
MediaOutletID
);
GO

CREATE UNIQUE CLUSTERED INDEX CIX_PrintMediaPlacement ON Sales.PrintMediaPlacement (
PrintMediaPlacementID ASC
);


GO
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
ON [Sales].[PrintMediaPlacement] ([PublicationDate],[PlacementCost])
INCLUDE ([MediaOutletID],[PlacementDate],[RelatedProductID])
GO


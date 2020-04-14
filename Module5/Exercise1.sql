USE [AdventureWorks2017]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE Sales.MediaOutlet(
	[MediaOutletId] [int] NOT NULL,
	[MediaOutletName] [nvarchar](50) NULL,
	[PrimaryContact] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL
);

CREATE TABLE Sales.PrintMediaPlacement(
	[PrintMediaPlacementId] [int] NOT NULL,
	[MediaOutletId] [int] NULL,
	[PlacementDate] [datetime] NULL,
	[PublicationDate] [datetime] NULL,
	[PlacementCost] [decimal](18, 0) NULL,
	[RelatedProductId] [int] NULL
);
GO



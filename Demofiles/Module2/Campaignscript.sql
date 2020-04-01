USE [AdventureWorks2017]
GO

/****** Object:  Table [DirectMarketing].[CampaignResponse]    Script Date: 4/1/2020 7:34:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [DirectMarketing].[CampaignResponse](
	[CampaignId] [int] NOT NULL,
	[CampaignDescription] [varchar](max) NOT NULL,
	[CampaignStartDate] [datetime] NOT NULL,
	[CampaignEndDate] [datetime] NOT NULL,
	[Profit] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



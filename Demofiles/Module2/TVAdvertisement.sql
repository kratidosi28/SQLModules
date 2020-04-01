USE [AdventureWorks2017]
GO

/****** Object:  Table [DirectMarketing].[TVAdvertisement]    Script Date: 4/1/2020 7:36:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [DirectMarketing].[TVAdvertisement](
	[TVAdvertisementId] [int] NOT NULL,
	[TVAdvertisementTitle] [varchar](50) NOT NULL,
	[TVAdvertisementCategory] [varchar](50) NOT NULL,
	[TVAdvertisementPostedOn] [date] NULL,
	[TVAdvertisementCompany] [varchar](50) NOT NULL,
	[TVAdvertisementDescription] [varchar](max) NOT NULL,
	[TVAdvertisementDuration] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TVAdvertisementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



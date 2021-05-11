USE [iSketch.app]
GO
/****** Object:  Table [dbo].[Words.Banned]    Script Date: 5/11/2021 1:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words.Banned](
	[WordID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Word] [varchar](50) NOT NULL,
	[Contains] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Words.Banned] ADD  CONSTRAINT [DF_Words.Banned_WordID]  DEFAULT (newid()) FOR [WordID]
GO
ALTER TABLE [dbo].[Words.Banned] ADD  CONSTRAINT [DF_Words.Banned_Contains]  DEFAULT ((1)) FOR [Contains]
GO

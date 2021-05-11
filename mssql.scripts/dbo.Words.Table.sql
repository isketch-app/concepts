USE [iSketch.app]
GO
/****** Object:  Table [dbo].[Words]    Script Date: 5/11/2021 1:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[WordID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Word] [varchar](50) NOT NULL,
	[Score] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Words] ADD  CONSTRAINT [DF_Words_WordID]  DEFAULT (newid()) FOR [WordID]
GO
ALTER TABLE [dbo].[Words] ADD  CONSTRAINT [DF_Words_Score]  DEFAULT ((0)) FOR [Score]
GO

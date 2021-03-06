USE [iSketch.app]
GO
/****** Object:  Table [dbo].[Words.Score.Difficulties]    Script Date: 5/11/2021 1:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words.Score.Difficulties](
	[DifficultyID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[From] [int] NOT NULL,
	[To] [int] NOT NULL,
	[Name] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Words.Score.Difficulties] ADD  CONSTRAINT [DF_Words.Difficulties_DifficultyID]  DEFAULT (newid()) FOR [DifficultyID]
GO
ALTER TABLE [dbo].[Words.Score.Difficulties] ADD  CONSTRAINT [DF_Words.Difficulties_From]  DEFAULT ((0)) FOR [From]
GO
ALTER TABLE [dbo].[Words.Score.Difficulties] ADD  CONSTRAINT [DF_Words.Difficulties_To]  DEFAULT ((0)) FOR [To]
GO

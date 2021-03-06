USE [iSketch.app]
GO
/****** Object:  Table [dbo].[Words.Difficulties]    Script Date: 5/24/2021 4:11:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words.Difficulties](
	[DifficultyID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[From] [int] NOT NULL,
	[To] [int] NOT NULL,
	[Name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Words.Difficulties] PRIMARY KEY CLUSTERED 
(
	[DifficultyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Words.Difficulties] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Words.Difficulties] ADD  CONSTRAINT [DF_Words.Difficulties_DifficultyID]  DEFAULT (newid()) FOR [DifficultyID]
GO
ALTER TABLE [dbo].[Words.Difficulties] ADD  CONSTRAINT [DF_Words.Difficulties_From]  DEFAULT ((0)) FOR [From]
GO
ALTER TABLE [dbo].[Words.Difficulties] ADD  CONSTRAINT [DF_Words.Difficulties_To]  DEFAULT ((0)) FOR [To]
GO

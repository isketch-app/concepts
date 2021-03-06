USE [iSketch.app]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/24/2021 4:11:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UserName] [char](20) NOT NULL,
	[CreatedTime] [datetime] NULL,
	[Password] [binary](384) NOT NULL,
	[ResetPasswordTime] [datetime] NULL,
	[Email] [varchar](50) NULL,
	[Biography] [varchar](500) NULL,
	[Score.Wins] [int] NOT NULL,
	[Score.Plays] [int] NOT NULL,
	[Score.Guesses] [int] NOT NULL,
	[Score.CorrectGuesses] [int] NOT NULL,
	[Settings.ShowEmail] [bit] NOT NULL,
	[Settings.RecievePromoEmails] [bit] NULL,
	[Settings.AnonMode] [bit] NOT NULL,
	[Settings.DarkMode] [bit] NULL,
	[ProfilePicture] [varbinary](max) NULL,
	[Score.Points] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserID]  DEFAULT (newid()) FOR [UserID]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ResetPasswordTime]  DEFAULT (NULL) FOR [ResetPasswordTime]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Email]  DEFAULT (NULL) FOR [Email]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Biography]  DEFAULT (NULL) FOR [Biography]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Score.Wins]  DEFAULT ((0)) FOR [Score.Wins]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Score.Plays]  DEFAULT ((0)) FOR [Score.Plays]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Score.Guesses]  DEFAULT ((0)) FOR [Score.Guesses]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Score.CorrectGuesses]  DEFAULT ((0)) FOR [Score.CorrectGuesses]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Settings.ShowEmail]  DEFAULT ((0)) FOR [Settings.ShowEmail]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Settings.RecievePromoEmails]  DEFAULT ((0)) FOR [Settings.RecievePromoEmails]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Settings.AnonMode]  DEFAULT ((0)) FOR [Settings.AnonMode]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Settings.DarkMode]  DEFAULT (NULL) FOR [Settings.DarkMode]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ProfilePicture]  DEFAULT (NULL) FOR [ProfilePicture]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Score.Points]  DEFAULT ((0)) FOR [Score.Points]
GO

USE [iSketch.app]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/8/2021 7:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UserName] [char](20) NOT NULL,
	[CreatedTime] [datetime] NULL,
	[DisabledTime] [datetime] NULL,
	[Password] [binary](256) NOT NULL,
	[ResetPasswordTime] [datetime] NULL,
	[ProfilePicture] [image] NULL,
	[Email] [char](50) NULL,
	[Biography] [char](500) NULL,
	[Score.Wins] [int] NOT NULL,
	[Score.Plays] [int] NOT NULL,
	[Score.Guesses] [int] NOT NULL,
	[Score.CorrectGuesses] [int] NOT NULL,
	[Settings.ShowEmail] [bit] NOT NULL,
	[Settings.RecievePromoEmails] [bit] NOT NULL,
	[Settings.AnonMode] [bit] NOT NULL,
	[Settings.DarkMode] [bit] NULL,
	[DisabledMessage] [char](100) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserID]  DEFAULT (newid()) FOR [UserID]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_DisabledTime]  DEFAULT (NULL) FOR [DisabledTime]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ResetPasswordTime]  DEFAULT (NULL) FOR [ResetPasswordTime]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ProfilePicture]  DEFAULT (NULL) FOR [ProfilePicture]
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
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_DisabledMessage]  DEFAULT ('You have been disabled!') FOR [DisabledMessage]
GO

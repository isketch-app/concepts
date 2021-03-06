USE [iSketch.app]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 5/24/2021 4:11:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[SessionID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[LogonTime] [datetime] NOT NULL,
	[LogonIPv4] [char](15) NULL,
	[LogonIPv6] [char](39) NULL,
	[UserID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sessions] ADD  CONSTRAINT [DF_Sessions_SessionID]  DEFAULT (newid()) FOR [SessionID]
GO
ALTER TABLE [dbo].[Sessions] ADD  CONSTRAINT [DF_Sessions_LogonTime]  DEFAULT (getdate()) FOR [LogonTime]
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [FK_Sessions_Users]
GO

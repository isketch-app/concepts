USE [iSketch.app]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 5/11/2021 1:14:20 AM ******/
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

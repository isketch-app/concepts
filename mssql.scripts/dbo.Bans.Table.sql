USE [iSketch.app]
GO
/****** Object:  Table [dbo].[Bans]    Script Date: 5/11/2021 1:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bans](
	[BanID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UserID] [uniqueidentifier] NULL,
	[CIDR.IPv4] [char](18) NULL,
	[CIDR.IPv6] [char](43) NULL,
	[Reason] [varchar](50) NULL,
	[Note] [varchar](100) NULL,
	[Description] [varchar](50) NULL,
	[ExpiresTime] [datetime] NULL,
	[CreatedTime] [datetime] NOT NULL,
	[IsBanEnabled] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bans] ADD  CONSTRAINT [DF_Bans_BanID]  DEFAULT (newid()) FOR [BanID]
GO
ALTER TABLE [dbo].[Bans] ADD  CONSTRAINT [DF_Bans_UserID]  DEFAULT (NULL) FOR [UserID]
GO
ALTER TABLE [dbo].[Bans] ADD  CONSTRAINT [DF_Bans_IPv4]  DEFAULT (NULL) FOR [CIDR.IPv4]
GO
ALTER TABLE [dbo].[Bans] ADD  CONSTRAINT [DF_Bans_IPv6]  DEFAULT (NULL) FOR [CIDR.IPv6]
GO
ALTER TABLE [dbo].[Bans] ADD  CONSTRAINT [DF_Bans_Reason]  DEFAULT (NULL) FOR [Reason]
GO
ALTER TABLE [dbo].[Bans] ADD  CONSTRAINT [DF_Bans_Note]  DEFAULT (NULL) FOR [Note]
GO
ALTER TABLE [dbo].[Bans] ADD  CONSTRAINT [DF_Bans_Description]  DEFAULT (NULL) FOR [Description]
GO
ALTER TABLE [dbo].[Bans] ADD  CONSTRAINT [DF_Bans_ExpiresTime]  DEFAULT (NULL) FOR [ExpiresTime]
GO
ALTER TABLE [dbo].[Bans] ADD  CONSTRAINT [DF_Bans_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Bans] ADD  CONSTRAINT [DF_Bans_Enabled]  DEFAULT ((1)) FOR [IsBanEnabled]
GO

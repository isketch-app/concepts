USE [iSketch.app]
GO
/****** Object:  Table [dbo].[Bans]    Script Date: 5/24/2021 4:11:37 PM ******/
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
	[IsBanEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_Bans] PRIMARY KEY CLUSTERED 
(
	[BanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[Bans]  WITH CHECK ADD  CONSTRAINT [FK_Bans_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Bans] CHECK CONSTRAINT [FK_Bans_Users]
GO

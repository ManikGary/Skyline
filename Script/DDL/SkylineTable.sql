USE [SkyLine]
GO
ALTER TABLE [dbo].[PostCode] DROP CONSTRAINT [FK_PostCode_SuburbList1]
GO
ALTER TABLE [dbo].[PostCode] DROP CONSTRAINT [FK_PostCode_State1]
GO
ALTER TABLE [dbo].[SuburbList] DROP CONSTRAINT [DF_SuburbList_IsDirty]
GO
ALTER TABLE [dbo].[State] DROP CONSTRAINT [DF_State_IsDirty]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/10/2016 11:11:24 AM ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[SuburbList]    Script Date: 17/10/2016 11:11:24 AM ******/
DROP TABLE [dbo].[SuburbList]
GO
/****** Object:  Table [dbo].[StreetType]    Script Date: 17/10/2016 11:11:24 AM ******/
DROP TABLE [dbo].[StreetType]
GO
/****** Object:  Table [dbo].[State]    Script Date: 17/10/2016 11:11:24 AM ******/
DROP TABLE [dbo].[State]
GO
/****** Object:  Table [dbo].[PropertyUsers]    Script Date: 17/10/2016 11:11:24 AM ******/
DROP TABLE [dbo].[PropertyUsers]
GO
/****** Object:  Table [dbo].[PropertyAddress]    Script Date: 17/10/2016 11:11:24 AM ******/
DROP TABLE [dbo].[PropertyAddress]
GO
/****** Object:  Table [dbo].[Property]    Script Date: 17/10/2016 11:11:24 AM ******/
DROP TABLE [dbo].[Property]
GO
/****** Object:  Table [dbo].[PostCode]    Script Date: 17/10/2016 11:11:24 AM ******/
DROP TABLE [dbo].[PostCode]
GO
/****** Object:  Table [dbo].[PostCode]    Script Date: 17/10/2016 11:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostCode](
	[ID] [uniqueidentifier] NOT NULL,
	[StateID] [uniqueidentifier] NOT NULL,
	[SuburbID] [uniqueidentifier] NOT NULL,
	[PostCode] [int] NOT NULL,
	[IsDirty] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PostCode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property]    Script Date: 17/10/2016 11:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[NoofUnit] [int] NOT NULL,
	[CreatedUser] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedUser] [uniqueidentifier] NOT NULL,
	[Modifieddate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyAddress]    Script Date: 17/10/2016 11:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyAddress](
	[PropertyAddressID] [uniqueidentifier] NOT NULL,
	[PropertyID] [uniqueidentifier] NOT NULL,
	[SLNo] [int] NOT NULL,
	[UnitNo] [nvarchar](50) NOT NULL,
	[PostCodeID] [uniqueidentifier] NOT NULL,
	[StreetTypeID] [uniqueidentifier] NOT NULL,
	[StreetName] [nvarchar](500) NOT NULL,
	[IsDirty] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PropertyAddress] PRIMARY KEY CLUSTERED 
(
	[PropertyAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyUsers]    Script Date: 17/10/2016 11:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyUsers](
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[PropertyAddressID] [uniqueidentifier] NOT NULL,
	[Status] [uniqueidentifier] NOT NULL,
	[IsOwner] [uniqueidentifier] NOT NULL,
	[StartLiving] [datetime] NOT NULL,
	[LeftProperty] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PropertyUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 17/10/2016 11:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[KeyName] [nvarchar](50) NOT NULL,
	[IsDirty] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StreetType]    Script Date: 17/10/2016 11:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StreetType](
	[ID] [uniqueidentifier] NOT NULL,
	[StreetType] [nvarchar](200) NOT NULL,
	[IsDirty] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StreetType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SuburbList]    Script Date: 17/10/2016 11:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuburbList](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[IsDirty] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SuburbList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/10/2016 11:11:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[MiddleName] [nvarchar](max) NOT NULL,
	[Lastname] [nvarchar](max) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[ContactNo] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DF_State_IsDirty]  DEFAULT ((0)) FOR [IsDirty]
GO
ALTER TABLE [dbo].[SuburbList] ADD  CONSTRAINT [DF_SuburbList_IsDirty]  DEFAULT ((0)) FOR [IsDirty]
GO
ALTER TABLE [dbo].[PostCode]  WITH CHECK ADD  CONSTRAINT [FK_PostCode_State1] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([ID])
GO
ALTER TABLE [dbo].[PostCode] CHECK CONSTRAINT [FK_PostCode_State1]
GO
ALTER TABLE [dbo].[PostCode]  WITH CHECK ADD  CONSTRAINT [FK_PostCode_SuburbList1] FOREIGN KEY([SuburbID])
REFERENCES [dbo].[SuburbList] ([ID])
GO
ALTER TABLE [dbo].[PostCode] CHECK CONSTRAINT [FK_PostCode_SuburbList1]
GO

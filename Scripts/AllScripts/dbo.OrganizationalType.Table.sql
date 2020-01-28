USE [HumanResourceManagerDB]
GO
/****** Object:  Table [dbo].[OrganizationalType]    Script Date: 24.01.2020 22:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganizationalType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrganizationalType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OrganizationalType] ON 

INSERT [dbo].[OrganizationalType] ([Id], [Name]) VALUES (9, N'ООО')
SET IDENTITY_INSERT [dbo].[OrganizationalType] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [uniqueOrganizationalTypeName]    Script Date: 24.01.2020 22:09:00 ******/
ALTER TABLE [dbo].[OrganizationalType] ADD  CONSTRAINT [uniqueOrganizationalTypeName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

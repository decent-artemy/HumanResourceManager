USE [HumanResourceManagerDB]
GO
/****** Object:  Table [dbo].[ActivityType]    Script Date: 24.01.2020 22:08:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ActivityType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ActivityType] ON 

INSERT [dbo].[ActivityType] ([Id], [Name]) VALUES (17, N'Проектирование сооружений')
SET IDENTITY_INSERT [dbo].[ActivityType] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [uniqueActivityTypeName]    Script Date: 24.01.2020 22:09:00 ******/
ALTER TABLE [dbo].[ActivityType] ADD  CONSTRAINT [uniqueActivityTypeName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

USE [master]
GO
/****** Object:  Database [HumanResourceManagerDB]    Script Date: 24.01.2020 22:11:38 ******/
CREATE DATABASE [HumanResourceManagerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HumanResourceManagerDB', FILENAME = N'D:\Soft\SQL Server\MSSQL14.SQLEXPRESS1\MSSQL\DATA\HumanResourceManagerDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HumanResourceManagerDB_log', FILENAME = N'D:\Soft\SQL Server\MSSQL14.SQLEXPRESS1\MSSQL\DATA\HumanResourceManagerDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HumanResourceManagerDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HumanResourceManagerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HumanResourceManagerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HumanResourceManagerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HumanResourceManagerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HumanResourceManagerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HumanResourceManagerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HumanResourceManagerDB] SET  MULTI_USER 
GO
ALTER DATABASE [HumanResourceManagerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HumanResourceManagerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HumanResourceManagerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HumanResourceManagerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HumanResourceManagerDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HumanResourceManagerDB] SET QUERY_STORE = OFF
GO
USE [HumanResourceManagerDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [HumanResourceManagerDB]
GO
/****** Object:  Table [dbo].[ActivityType]    Script Date: 24.01.2020 22:11:38 ******/
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
/****** Object:  Table [dbo].[Company]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationalTypeId] [int] NOT NULL,
	[ActivityTypeId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PositionId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](20) NOT NULL,
	[DateOfEmployment] [date] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganizationalType]    Script Date: 24.01.2020 22:11:38 ******/
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
/****** Object:  Table [dbo].[Position]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ActivityType] ON 

INSERT [dbo].[ActivityType] ([Id], [Name]) VALUES (17, N'Проектирование сооружений')
SET IDENTITY_INSERT [dbo].[ActivityType] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [OrganizationalTypeId], [ActivityTypeId], [Name]) VALUES (20, 9, 17, N'СтройТрест №3')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [PositionId], [CompanyId], [Name], [Surname], [MiddleName], [DateOfEmployment]) VALUES (21, 12, 20, N'Александр', N'Карпенков', N'Игнатьевич', CAST(N'2020-01-24' AS Date))
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[OrganizationalType] ON 

INSERT [dbo].[OrganizationalType] ([Id], [Name]) VALUES (9, N'ООО')
SET IDENTITY_INSERT [dbo].[OrganizationalType] OFF
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([Id], [Name]) VALUES (12, N'Стажер')
SET IDENTITY_INSERT [dbo].[Position] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [uniqueActivityTypeName]    Script Date: 24.01.2020 22:11:38 ******/
ALTER TABLE [dbo].[ActivityType] ADD  CONSTRAINT [uniqueActivityTypeName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uniqueCompanyName]    Script Date: 24.01.2020 22:11:38 ******/
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [uniqueCompanyName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uniqueOrganizationalTypeName]    Script Date: 24.01.2020 22:11:38 ******/
ALTER TABLE [dbo].[OrganizationalType] ADD  CONSTRAINT [uniqueOrganizationalTypeName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uniquePositionName]    Script Date: 24.01.2020 22:11:38 ******/
ALTER TABLE [dbo].[Position] ADD  CONSTRAINT [uniquePositionName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_ActivityType] FOREIGN KEY([ActivityTypeId])
REFERENCES [dbo].[ActivityType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_ActivityType]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_OrganizationalType] FOREIGN KEY([OrganizationalTypeId])
REFERENCES [dbo].[OrganizationalType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_OrganizationalType]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Company]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Position] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Position] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Position]
GO
/****** Object:  StoredProcedure [dbo].[spAddActivityType]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[spAddActivityType]     
(         
    @Name NVARCHAR(50)    
)    
as     
Begin     
    Insert into ActivityType (Name)     
    Values (@Name)     
End
GO
/****** Object:  StoredProcedure [dbo].[spAddCompany]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[spAddCompany]     
(    
    @ActivityTypeId INT,     
    @OrganizationalTypeId INT,      
    @Name NVARCHAR(100)    
        
)    
as     
Begin     
    Insert into Company (ActivityTypeId, OrganizationalTypeId, Name)     
    Values (@ActivityTypeId, @OrganizationalTypeId, @Name)     
End
GO
/****** Object:  StoredProcedure [dbo].[spAddEmployee]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[spAddEmployee]     
(    
    @PositionId INT,     
    @CompanyId INT,    
    @Name NVARCHAR(20),    
    @Surname NVARCHAR(50),    
    @MiddleName NVARCHAR(20),
	@DateOfEmployment DATE    
)    
as     
Begin     
    Insert into Employee (PositionId, CompanyId, Name, Surname, MiddleName, DateOfEmployment)     
    Values (@PositionId, @CompanyId, @Name, @Surname, @MiddleName, @DateOfEmployment)     
End
GO
/****** Object:  StoredProcedure [dbo].[spAddOrganizationalType]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE procedure [dbo].[spAddOrganizationalType]     
(         
    @Name NVARCHAR(50)    
)    
as     
Begin     
    Insert into OrganizationalType (Name)     
    Values (@Name)     
End
GO
/****** Object:  StoredProcedure [dbo].[spAddPosition]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[spAddPosition]     
(         
    @Name NVARCHAR(50)    
)    
as     
Begin     
    Insert into Position (Name)     
    Values (@Name)     
End
GO
/****** Object:  StoredProcedure [dbo].[spDeleteActivityType]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






Create procedure [dbo].[spDeleteActivityType]     
(      
   @Id INT      
)      
as       
begin      
   Delete from ActivityType 
   where Id = @Id      
End


GO
/****** Object:  StoredProcedure [dbo].[spDeleteCompany]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




Create procedure [dbo].[spDeleteCompany]     
(      
   @Id INT      
)      
as       
begin      
   Delete from Company 
   where Id = @Id      
End


GO
/****** Object:  StoredProcedure [dbo].[spDeleteEmployee]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



Create procedure [dbo].[spDeleteEmployee]     
(      
   @Id int      
)      
as       
begin      
   Delete from Employee 
   where Id = @Id      
End


GO
/****** Object:  StoredProcedure [dbo].[spDeleteOrganizationalType]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







Create procedure [dbo].[spDeleteOrganizationalType]     
(      
   @Id INT      
)      
as       
begin      
   Delete from OrganizationalType 
   where Id = @Id      
End


GO
/****** Object:  StoredProcedure [dbo].[spDeletePosition]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





Create procedure [dbo].[spDeletePosition]     
(      
   @Id INT      
)      
as       
begin      
   Delete from Position 
   where Id = @Id      
End


GO
/****** Object:  StoredProcedure [dbo].[spGetActivityType]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[spGetActivityType] (
	@Id INT
)   
as    
Begin    
    select 

	ActivityType.Id,
	ActivityType.Name
	      
    from ActivityType

	where ActivityType.Id = @Id    
End
GO
/****** Object:  StoredProcedure [dbo].[spGetAllActivityTypes]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





create procedure [dbo].[spGetAllActivityTypes]    
as    
Begin    
    select 
	
	ActivityType.Id,
	ActivityType.Name
	      
    from ActivityType 
End
GO
/****** Object:  StoredProcedure [dbo].[spGetAllCompanies]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spGetAllCompanies]    
as    
Begin    
    select 
	
	Company.Id,
	OrganizationalType.Id as OrganizationalTypeId,
	OrganizationalType.Name as OrganizationalTypeName,
	ActivityType.Id as ActivityTypeId,
	ActivityType.Name as ActivityTypeName,
	Company.Name,
	(select COUNT(*) from Employee WHERE Employee.CompanyId = Company.Id) as Size
	      
    from Company

	join OrganizationalType on Company.OrganizationalTypeId = OrganizationalType.Id
	join ActivityType on Company.ActivityTypeId = ActivityType.Id    
End
GO
/****** Object:  StoredProcedure [dbo].[spGetAllEmployees]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spGetAllEmployees]    
as    
Begin    
    select 
	Employee.Id as Id,
	Position.Id as PositionId,
	Position.Name as PositionName,
	Company.Id as CompanyId,
	ActivityType.Id as ActivitiTypeId,
	ActivityType.Name as ActivityTypeName,
	OrganizationalType.Id as OrganizationalTypeId,
	OrganizationalType.Name as OrganizationalTypeName,
	Company.Name as CompanyName,
	Employee.Name,
	Employee.Surname,
	Employee.MiddleName,
	Employee.DateOfEmployment,
	(select COUNT(*) from Employee WHERE Employee.CompanyId = Company.Id) as Size
	      
    from Employee

	join Position on Employee.PositionId = Position.Id
	join Company on Employee.CompanyId = Company.Id
	join ActivityType on Company.ActivityTypeId = ActivityType.Id
	join OrganizationalType on Company.OrganizationalTypeId = OrganizationalType.Id    
End
GO
/****** Object:  StoredProcedure [dbo].[spGetAllOrganizationalTypes]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE procedure [dbo].[spGetAllOrganizationalTypes]    
as    
Begin    
    select 
	
	OrganizationalType.Id,
	OrganizationalType.Name
	      
    from OrganizationalType 
End
GO
/****** Object:  StoredProcedure [dbo].[spGetAllPositions]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[spGetAllPositions]    
as    
Begin    
    select 
	
	Position.Id,
	Position.Name
	      
    from Position 
End
GO
/****** Object:  StoredProcedure [dbo].[spGetCompany]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[spGetCompany] (
	@Id INT
)   
as    
Begin    
    select 
	Company.Id as Id,
	OrganizationalType.Id as OrganizationalTypeId,
	OrganizationalType.Name as OrganizationalTypeName,
	ActivityType.Id as ActivitiTypeId,
	ActivityType.Name as ActivityTypeName,
	Company.Name,
	(select COUNT(*) from Employee WHERE Employee.CompanyId = @Id) as Size
	      
    from Company

	join OrganizationalType on Company.OrganizationalTypeId = OrganizationalType.Id
	join ActivityType on Company.ActivityTypeId = ActivityType.Id

	where Company.Id = @Id    
End
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployee]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[spGetEmployee] (
	@Id INT
)   
as    
Begin    
    select 
	Employee.Id as Id,
	Position.Id as PositionId,
	Position.Name as PositionName,
	Company.Id as CompanyId,
	ActivityType.Id as ActivitiTypeId,
	ActivityType.Name as ActivityTypeName,
	OrganizationalType.Id as OrganizationalTypeId,
	OrganizationalType.Name as OrganizationalTypeName,
	Company.Name as CompanyName,
	Employee.Name,
	Employee.Surname,
	Employee.MiddleName,
	Employee.DateOfEmployment,
	(select COUNT(*) from Employee WHERE Employee.CompanyId = Company.Id) as Size
	      
	      
    from Employee

	join Position on Employee.PositionId = Position.Id
	join Company on Employee.CompanyId = Company.Id
	join ActivityType on Company.ActivityTypeId = ActivityType.Id
	join OrganizationalType on Company.OrganizationalTypeId = OrganizationalType.Id
	
	where Employee.Id = @Id    
End
GO
/****** Object:  StoredProcedure [dbo].[spGetOrganizationalType]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE procedure [dbo].[spGetOrganizationalType] (
	@Id INT
)   
as    
Begin    
    select 

	OrganizationalType.Id,
	OrganizationalType.Name
	      
    from OrganizationalType

	where OrganizationalType.Id = @Id    
End
GO
/****** Object:  StoredProcedure [dbo].[spGetPosition]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[spGetPosition] (
	@Id INT
)   
as    
Begin    
    select 
	Position.Id,
	Position.Name
	      
    from Position

	where Position.Id = @Id    
End
GO
/****** Object:  StoredProcedure [dbo].[spIsActivityTypeExist]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spIsActivityTypeExist]
    @id int,
	@exist int out
AS
	IF (select ActivityType.Id from ActivityType where ActivityType.Id = @id) = @id
		set @exist = 1;
	ELSE set @exist = 0;

	return @exist
GO
/****** Object:  StoredProcedure [dbo].[spIsCompanyExist]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spIsCompanyExist]
    @id int,
	@exist int out
AS
	IF (select Company.Id from Company where Company.Id = @id) = @id
		set @exist = 1;
	ELSE set @exist = 0;

	return @exist
GO
/****** Object:  StoredProcedure [dbo].[spIsEmployeeExist]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spIsEmployeeExist]
    @id int,
	@exist int out
AS
	IF (select Employee.Id from Employee where Employee.Id = @id) = @id
		set @exist = 1;
	ELSE set @exist = 0;

	return @exist
GO
/****** Object:  StoredProcedure [dbo].[spIsOrganizationalTypeExist]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spIsOrganizationalTypeExist]
    @id int,
	@exist int out
AS
	IF (select OrganizationalType.Id from OrganizationalType where OrganizationalType.Id = @id) = @id
		set @exist = 1;
	ELSE set @exist = 0;

	return @exist
GO
/****** Object:  StoredProcedure [dbo].[spIsPositionExist]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spIsPositionExist]
    @id int,
	@exist int out
AS
	IF (select Position.Id from Position where Position.Id = @id) = @id
		set @exist = 1;
	ELSE set @exist = 0;

	return @exist
GO
/****** Object:  StoredProcedure [dbo].[spUpdateActivityType]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





Create procedure [dbo].[spUpdateActivityType]      
(
	@Id INT,
	@Name NVARCHAR(50)    
)      
as      
begin      
   Update ActivityType       
   set 
		Name = @Name      
   where Id=@Id      
End

GO
/****** Object:  StoredProcedure [dbo].[spUpdateCompany]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



Create procedure [dbo].[spUpdateCompany]      
(
	@Id INT,
	@ActivityTypeId INT,     
    @OrganizationalTypeId INT,      
    @Name NVARCHAR(100)    
)      
as      
begin      
   Update Company       
   set 
		ActivityTypeId = @ActivityTypeId,     
		OrganizationalTypeId = @OrganizationalTypeId,      
		Name = @Name      
   where Id=@Id      
End

GO
/****** Object:  StoredProcedure [dbo].[spUpdateEmployee]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[spUpdateEmployee]      
(
	@Id INT,  
	@PositionId INT,     
    @CompanyId INT,    
    @Name NVARCHAR(20),    
    @Surname NVARCHAR(50),    
    @MiddleName NVARCHAR(20),
	@DateOfEmployment DATE    
)      
as      
begin      
   Update Employee       
   set 
		PositionId = @PositionId,     
		CompanyId = @CompanyId,    
		Name = @Name,    
		Surname = @Surname,    
		MiddleName = @MiddleName,
		DateOfEmployment = @DateOfEmployment      
   where Id=@Id      
End

GO
/****** Object:  StoredProcedure [dbo].[spUpdateOrganizationalType]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






Create procedure [dbo].[spUpdateOrganizationalType]      
(
	@Id INT,
	@Name NVARCHAR(50)    
)      
as      
begin      
   Update OrganizationalType       
   set 
		Name = @Name      
   where Id=@Id      
End

GO
/****** Object:  StoredProcedure [dbo].[spUpdatePosition]    Script Date: 24.01.2020 22:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




Create procedure [dbo].[spUpdatePosition]      
(
	@Id INT,
	@Name NVARCHAR(50)    
)      
as      
begin      
   Update Position       
   set 
		Name = @Name      
   where Id=@Id      
End

GO
USE [master]
GO
ALTER DATABASE [HumanResourceManagerDB] SET  READ_WRITE 
GO

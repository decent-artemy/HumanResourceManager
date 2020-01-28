USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spGetAllCompanies]    Script Date: 24.01.2020 22:09:00 ******/
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

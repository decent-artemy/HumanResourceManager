USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployee]    Script Date: 24.01.2020 22:09:00 ******/
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

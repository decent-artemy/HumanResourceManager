USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spGetOrganizationalType]    Script Date: 24.01.2020 22:09:00 ******/
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

USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spGetAllOrganizationalTypes]    Script Date: 24.01.2020 22:09:00 ******/
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

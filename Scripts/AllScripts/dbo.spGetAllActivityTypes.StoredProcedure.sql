USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spGetAllActivityTypes]    Script Date: 24.01.2020 22:09:00 ******/
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

USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spGetActivityType]    Script Date: 24.01.2020 22:09:00 ******/
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

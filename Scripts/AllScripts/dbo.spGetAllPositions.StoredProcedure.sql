USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spGetAllPositions]    Script Date: 24.01.2020 22:09:00 ******/
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

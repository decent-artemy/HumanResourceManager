USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spDeletePosition]    Script Date: 24.01.2020 22:09:00 ******/
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

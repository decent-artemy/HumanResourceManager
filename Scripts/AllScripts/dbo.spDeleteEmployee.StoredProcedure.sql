USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteEmployee]    Script Date: 24.01.2020 22:09:00 ******/
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

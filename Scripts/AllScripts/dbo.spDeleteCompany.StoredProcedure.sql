USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCompany]    Script Date: 24.01.2020 22:09:00 ******/
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

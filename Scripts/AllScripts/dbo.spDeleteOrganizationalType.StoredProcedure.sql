USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteOrganizationalType]    Script Date: 24.01.2020 22:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







Create procedure [dbo].[spDeleteOrganizationalType]     
(      
   @Id INT      
)      
as       
begin      
   Delete from OrganizationalType 
   where Id = @Id      
End


GO

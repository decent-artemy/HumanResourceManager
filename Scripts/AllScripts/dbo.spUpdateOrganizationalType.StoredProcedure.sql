USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spUpdateOrganizationalType]    Script Date: 24.01.2020 22:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






Create procedure [dbo].[spUpdateOrganizationalType]      
(
	@Id INT,
	@Name NVARCHAR(50)    
)      
as      
begin      
   Update OrganizationalType       
   set 
		Name = @Name      
   where Id=@Id      
End

GO

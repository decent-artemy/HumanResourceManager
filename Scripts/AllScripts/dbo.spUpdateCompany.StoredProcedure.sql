USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spUpdateCompany]    Script Date: 24.01.2020 22:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



Create procedure [dbo].[spUpdateCompany]      
(
	@Id INT,
	@ActivityTypeId INT,     
    @OrganizationalTypeId INT,      
    @Name NVARCHAR(100)    
)      
as      
begin      
   Update Company       
   set 
		ActivityTypeId = @ActivityTypeId,     
		OrganizationalTypeId = @OrganizationalTypeId,      
		Name = @Name      
   where Id=@Id      
End

GO

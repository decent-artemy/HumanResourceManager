USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spUpdateEmployee]    Script Date: 24.01.2020 22:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[spUpdateEmployee]      
(
	@Id INT,  
	@PositionId INT,     
    @CompanyId INT,    
    @Name NVARCHAR(20),    
    @Surname NVARCHAR(50),    
    @MiddleName NVARCHAR(20),
	@DateOfEmployment DATE    
)      
as      
begin      
   Update Employee       
   set 
		PositionId = @PositionId,     
		CompanyId = @CompanyId,    
		Name = @Name,    
		Surname = @Surname,    
		MiddleName = @MiddleName,
		DateOfEmployment = @DateOfEmployment      
   where Id=@Id      
End

GO

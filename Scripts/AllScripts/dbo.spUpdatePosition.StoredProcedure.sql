USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spUpdatePosition]    Script Date: 24.01.2020 22:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




Create procedure [dbo].[spUpdatePosition]      
(
	@Id INT,
	@Name NVARCHAR(50)    
)      
as      
begin      
   Update Position       
   set 
		Name = @Name      
   where Id=@Id      
End

GO

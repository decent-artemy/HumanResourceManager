USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spAddEmployee]    Script Date: 24.01.2020 22:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[spAddEmployee]     
(    
    @PositionId INT,     
    @CompanyId INT,    
    @Name NVARCHAR(20),    
    @Surname NVARCHAR(50),    
    @MiddleName NVARCHAR(20),
	@DateOfEmployment DATE    
)    
as     
Begin     
    Insert into Employee (PositionId, CompanyId, Name, Surname, MiddleName, DateOfEmployment)     
    Values (@PositionId, @CompanyId, @Name, @Surname, @MiddleName, @DateOfEmployment)     
End
GO

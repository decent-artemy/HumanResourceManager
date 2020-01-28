USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spAddCompany]    Script Date: 24.01.2020 22:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[spAddCompany]     
(    
    @ActivityTypeId INT,     
    @OrganizationalTypeId INT,      
    @Name NVARCHAR(100)    
        
)    
as     
Begin     
    Insert into Company (ActivityTypeId, OrganizationalTypeId, Name)     
    Values (@ActivityTypeId, @OrganizationalTypeId, @Name)     
End
GO

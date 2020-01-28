USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spAddOrganizationalType]    Script Date: 24.01.2020 22:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE procedure [dbo].[spAddOrganizationalType]     
(         
    @Name NVARCHAR(50)    
)    
as     
Begin     
    Insert into OrganizationalType (Name)     
    Values (@Name)     
End
GO

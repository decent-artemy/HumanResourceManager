USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spAddActivityType]    Script Date: 24.01.2020 22:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[spAddActivityType]     
(         
    @Name NVARCHAR(50)    
)    
as     
Begin     
    Insert into ActivityType (Name)     
    Values (@Name)     
End
GO

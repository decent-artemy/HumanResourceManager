USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spAddPosition]    Script Date: 24.01.2020 22:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[spAddPosition]     
(         
    @Name NVARCHAR(50)    
)    
as     
Begin     
    Insert into Position (Name)     
    Values (@Name)     
End
GO

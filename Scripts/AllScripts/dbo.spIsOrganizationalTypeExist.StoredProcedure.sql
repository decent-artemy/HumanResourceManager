USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spIsOrganizationalTypeExist]    Script Date: 24.01.2020 22:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spIsOrganizationalTypeExist]
    @id int,
	@exist int out
AS
	IF (select OrganizationalType.Id from OrganizationalType where OrganizationalType.Id = @id) = @id
		set @exist = 1;
	ELSE set @exist = 0;

	return @exist
GO

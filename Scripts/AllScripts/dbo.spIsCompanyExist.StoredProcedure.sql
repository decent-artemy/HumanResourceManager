USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spIsCompanyExist]    Script Date: 24.01.2020 22:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spIsCompanyExist]
    @id int,
	@exist int out
AS
	IF (select Company.Id from Company where Company.Id = @id) = @id
		set @exist = 1;
	ELSE set @exist = 0;

	return @exist
GO

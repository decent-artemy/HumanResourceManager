USE [HumanResourceManagerDB]
GO
/****** Object:  StoredProcedure [dbo].[spIsPositionExist]    Script Date: 24.01.2020 22:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spIsPositionExist]
    @id int,
	@exist int out
AS
	IF (select Position.Id from Position where Position.Id = @id) = @id
		set @exist = 1;
	ELSE set @exist = 0;

	return @exist
GO

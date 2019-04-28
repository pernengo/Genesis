USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[Delete_UsersRoles]    Script Date: 28/4/2019 02:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Delete_UsersRoles]	@Id bigint = NULL,
											@UserId bigint = NULL,
											@RoleId bigint = NULL
AS

DECLARE @sql nvarchar(max);

SET @sql = 'DELETE FROM UsersRoles WHERE 1=1'

IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';

IF @UserId IS NOT NULL
	SET @sql = @sql + ' AND UserId = @UserId';

IF @RoleId IS NOT NULL
	SET @sql = @sql + ' AND RoleId = @RoleId';


IF NOT(@Id IS NULL AND @UserId IS NULL AND @RoleId IS NULL)
	EXEC sp_executesql @sql, N'
			@Id bigint, 
			@UserId bigint,
			@RoleId bigint',
			@Id, @UserId, @RoleId;
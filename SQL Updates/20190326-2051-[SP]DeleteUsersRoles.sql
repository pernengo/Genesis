USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[Delete_User]    Script Date: 26/3/2019 20:49:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Delete_UsersRoles]	@Id bigint = NULL,
											@UserId bigint = NULL,
											@RoleId bigint = NULL
AS

DECLARE @sql nvarchar(max);

SET @sql = 'DELETE FROM UsersRoles WHERE 1=1'

IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';

	ELSE IF @UserId IS NOT NULL
		SET @sql = @sql + ' AND UserId = @UserId';

		ELSE IF @RoleId IS NOT NULL
			SET @sql = @sql + ' AND RoleId = @RoleId';


IF NOT(@Id IS NULL AND @UserId IS NULL AND @RoleId IS NULL)
	EXEC sp_executesql @sql, N'
			@Id bigint, 
			@UserId bigint,
			@RoleId bigint',
			@Id, @UserId, @RoleId;
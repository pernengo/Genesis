USE [Genesis]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Update_UsersRoles]	@Id bigint,
											@UserId bigint,
											@RoleId bigint
AS

DECLARE @sql nvarchar(max);

SET @sql = 'UPDATE UsersRoles SET'

IF @UserId IS NOT NULL
	SET @sql = @sql + ' UserId = @UserId,';
IF @RoleId IS NOT NULL
	SET @sql = @sql + ' RoleId = @RoleId,';

SET @sql = SUBSTRING(@sql, 1, (LEN(@sql) - 1))
SET @sql = @sql + ' WHERE Id = @Id';

IF NOT(@UserId IS NULL AND @RoleId IS NULL)
	EXEC sp_executesql @sql, N'
			@Id bigint, 
			@UserId bigint, 
			@RoleId bigint',
			@Id, @UserId, @RoleId;
USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[Delete_RolesPermissions]    Script Date: 28/4/2019 02:21:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Delete_RolesPermissions]	@Id bigint = NULL,
													@RoleId bigint = NULL,
													@ModuleId bigint = NULL
AS

DECLARE @sql nvarchar(max);

SET @sql = 'DELETE FROM RolesPermissions WHERE 1=1'

IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';

IF @RoleId IS NOT NULL
	SET @sql = @sql + ' AND RoleId = @RoleId';

IF @ModuleId IS NOT NULL
	SET @sql = @sql + ' AND ModuleId = @ModuleId';


IF NOT(@Id IS NULL AND @RoleId IS NULL AND @ModuleId IS NULL)
	EXEC sp_executesql @sql, N'
			@Id bigint, 
			@RoleId bigint,
			@ModuleId bigint',
			@Id, @RoleId, @ModuleId;
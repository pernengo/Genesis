USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Role]    Script Date: 25/3/2019 23:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Delete_Role]	@Id bigint = NULL,
										@Role varchar(50) = NULL
AS

DECLARE @sql nvarchar(max);
DECLARE @aux bigint;

SET @sql = 'DELETE FROM Roles WHERE 1=1'

IF @Id IS NOT NULL 
BEGIN
	SET @sql = @sql + ' AND Id = @Id';
	SET @sql = @sql + ' DELETE FROM UsersRoles WHERE RoleId = @Id';
END

	ELSE IF @Role IS NOT NULL
	BEGIN
		SET @sql = @sql + ' AND Role = @Role';
		SELECT @aux=Id FROM [Roles] WHERE Role = @Role
		SET @sql = @sql + ' DELETE FROM UsersRoles WHERE RoleId = @aux';
	END


IF NOT(@Id IS NULL AND @Role IS NULL)
	EXEC sp_executesql @sql, N'
			@Id bigint, 
			@Role varchar(50),
			@aux bigint',
			@Id, @Role, @aux;